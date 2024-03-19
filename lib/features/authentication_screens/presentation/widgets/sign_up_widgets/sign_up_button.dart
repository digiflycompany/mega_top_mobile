import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignUpButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height16),
      child: PrimaryButton(
        onTap: () {
          if(formKey.currentState!.validate()){
            Routes.homePageRoute
                .moveToCurrentRouteAndRemoveAll;
          }
        },
        text: AppStrings.signUpEn,
      ),
    );
  }
}
