import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:context.height40 ),
      child: RowTextButton(
        firstText: AppStrings.alreadyHaveAnAccountEn,
        buttonText: AppStrings.loginEn,
        onTap: () {
          Routes.loginRoute.moveTo;
        },
      ),
    );
  }
}
