import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_cubit.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/cubit/on_boarding_states.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_first_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_second_screen.dart';
import 'on_boarding_third_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  late PageController _pageController;
  late OnboardingCubit onboardingCubit;
  int pageIndex =0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    onboardingCubit = context.read<OnboardingCubit>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: BlocConsumer<OnboardingCubit, OnBoardingState>(
  listener: (context, state) {},
  builder: (context, state) {
    return PageView(
       reverse: true,
       controller: _pageController,
       onPageChanged: (index) {
         onboardingCubit.setPageIndex(pageIndex=index);
       },
       children:  [
         OnboardingFirstScreen(pageController: _pageController,index: pageIndex,),
         OnboardingSecondScreen(pageController: _pageController,index: pageIndex,),
         OnboardingThirdScreen(pageController: _pageController,index: pageIndex,),
       ],
     );
  },
),
    );
  }
}
