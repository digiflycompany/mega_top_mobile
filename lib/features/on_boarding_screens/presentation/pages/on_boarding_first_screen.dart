import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_1.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';

class OnboardingFirstScreen extends StatelessWidget {
  final int index;
  final  PageController pageController;
  const OnboardingFirstScreen({super.key,required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FirstHeader(pageController: pageController,),
          VerticalSpace(context.height*0.014),
          const OnboardingDescription(
            title: AppStrings.exploreOurDigitalProducts,
            description: AppStrings.onBoardingDescription,
          ),
          VerticalSpace(context.height*0.028),
          DotsIndicator(
            reversed: true,
            dotsCount: 3,
            position: index,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.primaryColor,
              color: AppColors.dotsColor,
              activeSize:  Size(context.width*0.11, context.height*0.011),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          VerticalSpace(context.height*0.05),
           PrimaryButton(text: AppStrings.next,
          onTap: (){
            pageController.animateToPage(
               1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }),
        ],
      ),
    );
  }
}
