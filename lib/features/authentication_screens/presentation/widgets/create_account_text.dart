import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/row_two_text.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height16),
      child: RowTextButton(
        firstText: AppStrings.doNotHaveAccountEn,
        buttonText: AppStrings.createAccountEn,
        onTap: () {
          Routes.signUpRoute.moveTo;
        },
      ),
    );
  }
}
