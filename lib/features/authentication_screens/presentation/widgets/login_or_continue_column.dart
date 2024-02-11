import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class LoginOrContinueColumn extends StatelessWidget {
  const LoginOrContinueColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          AppStrings.welcomeToMegaTopEn,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700
          ),
        ),
        VerticalSpace(context.height*0.022 ),
        const Text(
          AppStrings.loginOrCreateEnEn,
          style: TextStyle(
              fontSize: 14,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
