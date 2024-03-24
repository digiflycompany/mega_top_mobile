import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: context.height12),
      child: const RowTextButton(
        firstText: AppStrings.ifYouDidNotRecCodeEn,
        buttonText: AppStrings.resendCodeEn,
      ),
    );
  }
}
