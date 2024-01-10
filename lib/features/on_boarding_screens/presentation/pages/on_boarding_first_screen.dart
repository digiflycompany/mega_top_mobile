import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/media_query.dart';
import '../../../../core/utils/app-color.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: context.height*0.55,
            decoration: BoxDecoration(
              color: AppColors.onboardingBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
