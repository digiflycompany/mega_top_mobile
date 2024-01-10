import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_first_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_second_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  late PageController _pageController;
  int pageIndex =0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageView(
       controller: _pageController,
       onPageChanged: (index) {
         setState(() {
           pageIndex =index;
         });
       },
       children:  [
         OnboardingFirstScreen(pageController: _pageController,index: pageIndex,),
         OnboardingSecondScreen(pageController: _pageController,index: pageIndex,),
         Container(color: Colors.blue,),
       ],
     ),
    );
  }
}
