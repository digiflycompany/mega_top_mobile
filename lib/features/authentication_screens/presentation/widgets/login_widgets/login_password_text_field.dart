import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height24),
      child: PasswordTextField(
        hintText: AppStrings.passwordEn,
        prefixSvg: AppAssets.passwordIcon,
        validator: (value) {
          if (value!.isEmpty) {
            return AppStrings.pleaseEnterYourPassword;
          }
          return null;
        },
      ),
    );
  }
}
