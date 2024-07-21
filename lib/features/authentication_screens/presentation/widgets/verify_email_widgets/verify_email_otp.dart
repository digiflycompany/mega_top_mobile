import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_otp_row.dart';

class VerifyEmailOtp extends StatelessWidget {
  const VerifyEmailOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height24,bottom: context.height40),
      child: OTPResetPasswordRow(),
    );
  }
}
