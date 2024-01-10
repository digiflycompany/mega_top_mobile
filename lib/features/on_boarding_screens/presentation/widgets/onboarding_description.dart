import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class OnboardingDescription extends StatelessWidget {
  const OnboardingDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
      child: Column(
        children: [
          const Text(
            AppStrings.exploreOurDigitalProducts,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700
            ),
          ),
          VerticalSpace(context.height*0.017),
          const Text(
            AppStrings.onBoardingDescription,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
