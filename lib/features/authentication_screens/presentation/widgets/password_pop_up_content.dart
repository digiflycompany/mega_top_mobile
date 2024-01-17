import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class PasswordPopUpContent extends StatelessWidget {
  const PasswordPopUpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height*0.402,
        width:context.width*0.92125,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: context.height*0.055),
              child: Container(
                width: context.width*0.33,
                height: context.height*0.165,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.onboardingBackgroundColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor
                    ),
                    child: Center(
                      child: SvgPicture.asset(AppAssets.checkBigIcon),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
