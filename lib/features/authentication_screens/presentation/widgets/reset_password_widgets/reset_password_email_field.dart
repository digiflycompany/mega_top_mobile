import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';

class ResetPasswordEmailField extends StatelessWidget {
  const ResetPasswordEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height40),
      child: const PrimaryTextField(
        hintText: AppStrings.emailEn,
        prefixSvg: AppAssets.emailSecondIcon,
      ),
    );
  }
}
