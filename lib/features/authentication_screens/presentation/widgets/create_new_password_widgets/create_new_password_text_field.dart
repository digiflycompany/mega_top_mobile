import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class CreateNewPasswordTextField extends StatelessWidget {
  const CreateNewPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit authenticationCubit = context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: context.height24),
          child: PasswordTextField(
            controller: authenticationCubit.createNewPasswordController,
            hintText: AppStrings.enterYourNewPasswordEn,
            prefixSvg: AppAssets.passwordIcon,
            validator: (value) {
              RegExp regExp = new RegExp(authenticationCubit.passwordPattern);
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterYourPassword;
              } else if (!regExp.hasMatch(value)) {
                return AppStrings.passwordVerification;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
