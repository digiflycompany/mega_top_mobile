import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/already_have_an_account.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_confirm_password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_email_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/sign_up_user_name_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: context.width16),
        child: Column(
          children: [
            const SignUpUserNameTextField(),
            const SignUpEmailTextField(),
            const SignUpPasswordTextField(),
            const SignUpConfirmPasswordTextField(),
            SignUpButton(formKey: _formKey,),
            const AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
