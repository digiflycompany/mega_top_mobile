import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_email_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/login_widgets/login_password_text_field.dart';
import 'create_account_text.dart';
import 'forgot_password_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late AuthenticationCubit authenticationCubit;
  // @override
  // void initState() {
  //   super.initState();
  //   authenticationCubit = context.read<AuthenticationCubit>();
  // }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
            child: Column(
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
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
