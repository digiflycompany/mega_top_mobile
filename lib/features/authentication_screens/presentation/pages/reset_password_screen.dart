import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forget_password_custom_icon.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_divider.dart';
import '../../../../core/utils/app_string.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.087),
          child: const CustomAppBar(AppStrings.resetPasswordEn)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          children: [
            VerticalSpace(context.height*0.055),
            const Row(
              children: [
                ForgotPasswordIcon(
                  color: AppColors.primaryColor,
                  icon: AppAssets.forgetPasswordWhiteIcon,
                ),
                ForgotPasswordDivider(color: AppColors.iconsBackgroundColor,),
                ForgotPasswordIcon(
                  color: AppColors.iconsBackgroundColor,
                  icon: AppAssets.checkMailBlueIcon,
                ),
                ForgotPasswordDivider(color: AppColors.iconsBackgroundColor,),
                ForgotPasswordIcon(
                  color: AppColors.iconsBackgroundColor,
                  icon: AppAssets.newPasswordBlueIcon,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
