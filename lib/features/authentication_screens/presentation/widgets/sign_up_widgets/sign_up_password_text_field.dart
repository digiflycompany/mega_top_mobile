import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/sign_up_cubit/sign_up_state.dart';

class SignUpPasswordTextField extends StatelessWidget {
  const SignUpPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit signUpCubit = context.read<SignUpCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: PasswordTextField(
            controller: signUpCubit.signUpPasswordController,
            hintText: AppStrings.passwordEn,
            prefixSvg: AppAssets.passwordIcon,
            isPasswordVisible: signUpCubit.isPasswordVisible,
            togglePassword: ()=>signUpCubit.togglePasswordVisibility(),
            validator: (value) {
              RegExp regExp = new RegExp(signUpCubit.passwordPattern);
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
