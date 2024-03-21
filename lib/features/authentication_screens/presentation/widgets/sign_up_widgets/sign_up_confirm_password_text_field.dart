import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class SignUpConfirmPasswordTextField extends StatelessWidget {
  const SignUpConfirmPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit signUpCubit = context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height40),
          child: PasswordTextField(
            controller: signUpCubit.signUpConfirmPasswordController,
            hintText: AppStrings.confirmPasswordEn,
            prefixSvg: AppAssets.passwordIcon,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseConfirmYourPassword;
              } else if (signUpCubit.signUpConfirmPasswordController.text!=signUpCubit.signUpPasswordController.text) {
                return AppStrings.passwordsNotMatching;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}