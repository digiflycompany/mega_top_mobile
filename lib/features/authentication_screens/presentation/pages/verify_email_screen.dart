import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_otp.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomAppBar(AppStrings.verifyYourEmailEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerifyEmailCondition(),
              const VerifyEmailDescription(),
              const VerifyEmailOtp(),
              PrimaryButton(
                text: AppStrings.verifyEn,
                onTap: () {
                  Routes.createNewPasswordRoute.moveTo;
                },
              ),
              VerticalSpace(context.height * 0.033),
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
