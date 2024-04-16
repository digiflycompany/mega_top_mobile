import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_3.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';

class OnboardingThirdScreen extends StatelessWidget {
  final int index;
  final PageController pageController;
  const OnboardingThirdScreen(
      {super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ThirdHeader(
            pageController: pageController,
          ),
          VerticalSpace(context.height * 0.050),
          const OnboardingDescription(
            title: AppStrings.getYourOrderSuccessfullyEn,
            description: AppStrings.onboardingThirdScreenDescription,
          ),
        ],
      ),
    );
  }
}
