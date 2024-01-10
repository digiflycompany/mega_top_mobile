import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_1.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FirstHeader(),
          VerticalSpace(context.height*0.014),
          const OnboardingDescription(),
          VerticalSpace(context.height*0.03),
          DotsIndicator(
            dotsCount: 3,
            position: 0,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.primaryColor,
              color: AppColors.dotsColor,
              activeSize:  Size(context.width*0.11, context.height*0.011),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ],
      ),
    );
  }
}
