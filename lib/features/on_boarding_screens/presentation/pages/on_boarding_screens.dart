import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_cubit.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_states.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_first_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_second_screen.dart';
import 'on_boarding_third_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              return Column(children: [
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
                onboardingCubit.getPageIndex() == 2
                    ? VerticalSpace(context.height * 0.033)
                    : VerticalSpace(context.height * 0.036),
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
                onboardingCubit.getPageIndex() == 2
                    ? VerticalSpace(context.height * 0.035)
                    : VerticalSpace(context.height * 0.05),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.045),
                  child: PrimaryButton(
                      content: Text(
                        onboardingCubit.getPageIndex() == 2
                            ? AppLocalizations.of(context)!.getStarted
                            : AppLocalizations.of(context)!.next,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                      onTap: () {
                        onboardingCubit.getPageIndex() == 2
                            ? Routes
                                .homePageRoute.moveToCurrentRouteAndRemoveAll
                            : onboardingCubit.pageController.animateToPage(
                                onboardingCubit.getPageIndex() + 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                        PreferencesHelper.setHasSeenOnboarding(true);
                      }),
                ),
                onboardingCubit.getPageIndex() == 2
                    ? VerticalSpace(context.height * 0.02)
                    : VerticalSpace(context.height * 0.034),
                if (onboardingCubit.getPageIndex() == 2)
                  RowTextButton(
                      firstText:
                          AppLocalizations.of(context)!.alreadyHaveAnAccount,
                      buttonText: AppLocalizations.of(context)!.login,
                      onTap: () {
                        Routes.loginRoute.moveToCurrentRouteAndRemoveAll;
                        PreferencesHelper.setHasSeenOnboarding(true);
                        PreferencesHelper.saveIsVisitor(isVisitor: true);
                      }),
                onboardingCubit.getPageIndex() == 2
                    ? VerticalSpace(context.height * 0.02)
                    : VerticalSpace(context.height * 0.034)
              ]);
            }));
  }
}