import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_color.dart';

class LatestOffersContainer extends StatelessWidget {
  const LatestOffersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: context.width*0.246,
      height: context.height*0.124,
      decoration: BoxDecoration(
        color: AppColors.onboardingBackgroundColor,
        borderRadius: BorderRadius.circular(context.height*0.006),
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: context.height*0.012),
        child: Column(
          children: [
            Image.asset(AppAssets.smallHardDiskImage,width: context.width*0.095,),
            VerticalSpace(context.height*0.008),
            const Text(
                AppStrings.storageUnitsSmallEn,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 10
                ),
            ),
            VerticalSpace(context.height*0.0026),
            const Text(
              AppStrings.discount15PercentEn,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 8
              ),
            ),
          ],
        ),
      ),
    );
  }
}
