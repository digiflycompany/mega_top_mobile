import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/otp_row.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/please_enter_four_digits_code_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/resend_code_row.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/user_email_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/verify_email_button.dart';

class SignUpEmailVerificationScreen extends StatelessWidget {
  const SignUpEmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomAppBar(AppStrings.verifyYourEmailEn)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width16),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const PleaseEnterFourDigitsCodeText(),
             const UserEmailText(),
             OTPRow(),
             const VerifyEmailButton(),
             const ResendCodeRow(),
           ],
        ),
      ),
    );
  }
}
