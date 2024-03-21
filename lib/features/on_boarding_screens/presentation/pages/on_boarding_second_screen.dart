import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_2.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';

class OnboardingSecondScreen extends StatelessWidget {
  final int index;
  final PageController pageController;
  const OnboardingSecondScreen(
      {super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SecondHeader(
            pageController: pageController,
          ),
          VerticalSpace(context.height * 0.0346),
          const OnboardingDescription(
            title: AppStrings.addYourProductsToCartEn,
            description: AppStrings.onBoardingDescriptionEn,
          ),
        ],
      ),
    );
  }
}
