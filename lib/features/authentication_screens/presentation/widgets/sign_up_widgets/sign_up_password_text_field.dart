import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';

class SignUpPasswordTextField extends StatelessWidget {
  const SignUpPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: context.height24),
      child: const PasswordTextField(
        hintText: AppStrings.passwordEn,
        prefixSvg: AppAssets.passwordIcon,
      ),
    );
  }
}
