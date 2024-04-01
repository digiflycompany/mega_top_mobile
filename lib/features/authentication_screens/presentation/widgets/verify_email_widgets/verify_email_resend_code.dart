import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';

class VerifyEmailResendCode extends StatelessWidget {
  const VerifyEmailResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return const RowTextButton(
      firstText: AppStrings.ifYouDidNotRecCodeEn,
      buttonText: AppStrings.resendCodeEn,
    );
  }
}
