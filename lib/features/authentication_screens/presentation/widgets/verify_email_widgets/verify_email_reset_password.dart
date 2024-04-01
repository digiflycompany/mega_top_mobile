import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';

class VerifyEmailResetPasswordButton extends StatelessWidget {
  const VerifyEmailResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:context.height24),
      child: PrimaryButton(
        text: AppStrings.verifyEn,
        onTap: () =>
        Routes.createNewPasswordRoute.moveTo
      ),
    );
  }
}
