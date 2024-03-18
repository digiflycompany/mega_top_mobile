import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/repo/auth_repo.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_email_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_password_text_field.dart';
import 'create_account_text.dart';
import 'forgot_password_text.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (BuildContext context) => AuthenticationCubit(AuthRepoImp()),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: const Column(
                children: [
                  LoginEmailTextField(),
                  LoginPasswordTextField(),
                  ForgotPassword(),
                  LoginButton(),
                  CreateAccountText(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
