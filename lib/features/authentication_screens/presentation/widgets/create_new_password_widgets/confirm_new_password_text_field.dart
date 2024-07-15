import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class ConfirmNewPasswordTextField extends StatelessWidget {
  const ConfirmNewPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit authenticationCubit = context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height40),
          child: PasswordTextField(
            controller: authenticationCubit.confirmNewPasswordController,
            hintText: AppStrings.confirmYourNewPasswordEn,
            prefixSvg: AppAssets.passwordIcon,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseConfirmYourPassword;
              } else if (authenticationCubit.confirmNewPasswordController?.text!=authenticationCubit.createNewPasswordController?.text) {
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
