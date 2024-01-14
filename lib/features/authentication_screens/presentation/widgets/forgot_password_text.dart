import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        AppStrings.forgotPasswordEn,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
    );
  }
}
