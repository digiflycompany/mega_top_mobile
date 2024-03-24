import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';

class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height40),
      child: const PrimaryButton(
        text: AppStrings.verifyEn,
      ),
    );
  }
}
