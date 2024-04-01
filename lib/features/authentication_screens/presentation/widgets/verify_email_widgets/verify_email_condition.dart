import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forget_password_custom_icon.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_divider.dart';

class VerifyEmailCondition extends StatelessWidget {
  const VerifyEmailCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.055,bottom: context.height * 0.06),
      child: const Row(
        children: [
          ForgotPasswordIcon(
            color: AppColors.primaryColor,
            icon: AppAssets.checkIcon,
          ),
          ForgotPasswordDivider(
            color: AppColors.primaryColor,
          ),
          ForgotPasswordIcon(
            color: AppColors.primaryColor,
            icon: AppAssets.checkMailWhiteIcon,
          ),
          ForgotPasswordDivider(
            color: AppColors.iconsBackgroundColor,
          ),
          ForgotPasswordIcon(
            color: AppColors.iconsBackgroundColor,
            icon: AppAssets.newPasswordBlueIcon,
          ),
        ],
      ),
    );
  }
}
