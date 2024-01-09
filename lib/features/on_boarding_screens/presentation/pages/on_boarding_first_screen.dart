import 'package:flutter/material.dart';

import '../../../../core/utils/app-color.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.onboardingBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
