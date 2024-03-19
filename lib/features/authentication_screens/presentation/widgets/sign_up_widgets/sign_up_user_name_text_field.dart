import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';

class SignUpUserNameTextField extends StatelessWidget {
  const SignUpUserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: context.height24),
      child: const PrimaryTextField(
        hintText: AppStrings.usernameEn,
        prefixSvg: AppAssets.usernameIcon,
      ),
    );
  }
}
