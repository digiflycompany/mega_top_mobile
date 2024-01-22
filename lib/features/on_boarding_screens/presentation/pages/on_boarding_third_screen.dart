import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_arrow_button.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/header_onboarding_3.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/widgets/onboarding_description.dart';
import '../../../../core/utils/app_routes.dart';

class OnboardingThirdScreen extends StatelessWidget {
  final int index;
  final  PageController pageController;
  const OnboardingThirdScreen({super.key,required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThirdHeader(pageController: pageController,),
            VerticalSpace(context.height*0.050),
            const OnboardingDescription(
              title:AppStrings.getYourOrderSuccessfullyEn,
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
            PrimaryArrowButton(
                text: AppStrings.getStarted,
                onTap: (){
                  Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
                }),
            VerticalSpace(context.width*0.044),
            RowTextButton (
              firstText: AppStrings.alreadyHaveAnAccountEn,
              buttonText: AppStrings.loginEn,
              onTap: (){
                Routes.loginRoute.moveToAndRemoveCurrent;
              },
            ),
            VerticalSpace(context.height*0.04),
          ],
        ),
      ),
    );
  }
}
