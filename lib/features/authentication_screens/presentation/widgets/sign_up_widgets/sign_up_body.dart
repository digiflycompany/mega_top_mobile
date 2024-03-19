import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_confirm_password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_email_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_user_name_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: context.width16),
      child: Column(
        children: [
          const SignUpUserNameTextField(),
          const SignUpEmailTextField(),
          const SignUpPasswordTextField(),
          const SignUpConfirmPasswordTextField(),
          const SignUpButton(),
          RowTextButton(
            firstText: AppStrings.alreadyHaveAnAccountEn,
            buttonText: AppStrings.loginEn,
            onTap: () {
              Routes.loginRoute.moveTo;
            },
          ),
        ],
      ),
    );
  }
}
