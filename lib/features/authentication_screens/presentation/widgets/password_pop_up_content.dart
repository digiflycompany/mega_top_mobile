import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class PasswordPopUpContent extends StatelessWidget {
  const PasswordPopUpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.402,
        width: context.width * 0.92125,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.055),
              child: Container(
                width: context.width * 0.33,
                height: context.height * 0.165,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.onboardingBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primaryColor),
                    child: Center(
                      child: SvgPicture.asset(AppAssets.checkBigIcon),
                    ),
                  ),
                ),
              ),
            ),
            VerticalSpace(context.height * 0.03),
            Text(
              AppStrings.congratulationsEn,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            VerticalSpace(context.height * 0.023),
            Text(
              AppStrings.yourPasswordHasBeenResetSuccessfullyEn,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: context.width * 0.005),
            ),
          ],
        ));
  }
}
