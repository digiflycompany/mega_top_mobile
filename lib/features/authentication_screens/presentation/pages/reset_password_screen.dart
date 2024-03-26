import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_condition.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/primary_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomAppBar(AppStrings.resetPasswordEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ResetPasswordCondition(),
              const ForgotPasswordDescription(
                text: AppStrings.enterYourEmailAddressEn,
              ),
              VerticalSpace(context.height * 0.033),
              const PrimaryTextField(
                hintText: AppStrings.emailEn,
                prefixSvg: AppAssets.emailSecondIcon,
              ),
              VerticalSpace(context.height * 0.055),
              PrimaryButton(
                text: AppStrings.sendEn,
                onTap: () {
                  Routes.verifyEmailRoute.moveTo;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
