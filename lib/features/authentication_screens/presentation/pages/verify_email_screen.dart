import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forget_password_custom_icon.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_divider.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/otp_row.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const CustomAppBar(AppStrings.verifyYourEmailEn)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(context.height*0.055),
              const Row(
                children: [
                  ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.checkIcon,
                  ),
                  ForgotPasswordDivider(color: AppColors.primaryColor,),
                  ForgotPasswordIcon(
                    color: AppColors.primaryColor,
                    icon: AppAssets.checkMailWhiteIcon,
                  ),
                  ForgotPasswordDivider(color: AppColors.iconsBackgroundColor,),
                  ForgotPasswordIcon(
                    color: AppColors.iconsBackgroundColor,
                    icon: AppAssets.newPasswordBlueIcon,
                  ),
                ],
              ),
              VerticalSpace(context.height*0.06),
              const ForgotPasswordDescription(
                text: AppStrings.pleaseEnter4DigitsEn,
              ),
              VerticalSpace(context.height*0.033),
              const OtpRow(),
              VerticalSpace(context.height*0.055),
              PrimaryButton(
                text: AppStrings.verifyEn,
                onTap: (){
                  Routes.createNewPasswordRoute.moveTo;
                },
              ),
              VerticalSpace(context.height*0.033),
              const RowTextButton(
                firstText: AppStrings.ifYouDidNotRecCodeEn,
                buttonText: AppStrings.resendCodeEn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
