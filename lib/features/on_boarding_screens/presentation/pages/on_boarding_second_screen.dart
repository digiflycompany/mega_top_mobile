import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_2.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';

class OnboardingSecondScreen extends StatelessWidget {
  final int index;
  final  PageController pageController;
  const OnboardingSecondScreen({super.key,required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SecondHeader(pageController: pageController,),
            VerticalSpace(context.height*0.0346),
            const OnboardingDescription(
              title:AppStrings.addYourProductsToCartEn,
              description: AppStrings.onBoardingDescriptionEn,
            ),
            VerticalSpace(context.height*0.028),
            DotsIndicator(
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
            Padding(
                padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
              child: PrimaryButton(
                  text: AppStrings.nextEn,
                  onTap: (){
                    pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }),
            ),
            VerticalSpace(context.height*0.0329),
            PrimaryEmptyButton(
                text: AppStrings.previousEn,
                onTap: (){
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }),
            VerticalSpace(context.height*0.04),
          ],
        ),
      ),
    );
  }
}
