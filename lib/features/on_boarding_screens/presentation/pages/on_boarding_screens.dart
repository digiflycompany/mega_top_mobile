import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();

    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
              onboardingCubit.setPageIndex(pageIndex = index);
            },
            children: [
              OnboardingFirstScreen(pageController: _pageController, index: pageIndex),
              OnboardingSecondScreen(pageController: _pageController, index: pageIndex),
              OnboardingThirdScreen(pageController: _pageController, index: pageIndex),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
