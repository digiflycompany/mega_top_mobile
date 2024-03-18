import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_email_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_password_text_field.dart';
import 'create_account_text.dart';
import 'forgot_password_text.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
        final _formKey = GlobalKey<FormState>();
        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child:Column(
              children: [
                const LoginEmailTextField(),
                const LoginPasswordTextField(),
                const ForgotPassword(),
                LoginButton(formKey: _formKey,),
                const CreateAccountText(),
              ],
            ),
          ),
        );

  }
}
