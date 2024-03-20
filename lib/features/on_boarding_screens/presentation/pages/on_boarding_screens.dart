import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_cubit.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_states.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_first_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_second_screen.dart';

import 'on_boarding_third_screen.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (_) => OnboardingCubit(),
      child: const OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();

    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: onboardingCubit.pageController,
                  onPageChanged: (index) {
                    onboardingCubit.setPageIndex(index);
                  },
                  children: [
                    OnboardingFirstScreen(
                        pageController: onboardingCubit.pageController,
                        index: onboardingCubit.getPageIndex()),
                    OnboardingSecondScreen(
                        pageController: onboardingCubit.pageController,
                        index: onboardingCubit.getPageIndex()),
                    OnboardingThirdScreen(
                        pageController: onboardingCubit.pageController,
                        index: onboardingCubit.getPageIndex()),
                  ],
                ),
              ),
              VerticalSpace(context.width * 0.044),
              DotsIndicator(
                dotsCount: 3,
                position: onboardingCubit.getPageIndex(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeColor: AppColors.primaryColor,
                  color: AppColors.dotsColor,
                  activeSize:
                      Size(context.width * 0.11, context.height * 0.011),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              VerticalSpace(context.height * 0.05),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.045),
                child: PrimaryButton(
                    text: onboardingCubit.getPageIndex() == 2
                        ? AppStrings.getStarted
                        : AppStrings.nextEn,
                    onTap: () {
                      onboardingCubit.getPageIndex() == 2
                          ? Routes.homePageRoute.moveToCurrentRouteAndRemoveAll
                          : onboardingCubit.pageController.animateToPage(
                              onboardingCubit.getPageIndex() + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                    }),
              ),
              VerticalSpace(context.width * 0.044),
              RowTextButton(
                firstText: AppStrings.alreadyHaveAnAccountEn,
                buttonText: AppStrings.loginEn,
                onTap: () {
                  Routes.loginRoute.moveToAndRemoveCurrent;
                },
              ),
              VerticalSpace(context.height * 0.044),
            ],
          );
        },
      ),
    );
  }
}
