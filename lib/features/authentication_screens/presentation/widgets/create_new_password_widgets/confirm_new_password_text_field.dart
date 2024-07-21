import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_state.dart';

class ConfirmNewPasswordTextField extends StatelessWidget {
  const ConfirmNewPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit resetPasswordCubit = context.read<ResetPasswordCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height40),
          child: PasswordTextField(
            controller: resetPasswordCubit.confirmNewPasswordController,
            hintText: AppStrings.confirmYourNewPasswordEn,
            prefixSvg: AppAssets.passwordIcon,
            isPasswordVisible: resetPasswordCubit.isPasswordVisible,
            togglePassword: ()=>resetPasswordCubit.togglePasswordVisibility(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseConfirmYourPassword;
              } else if (resetPasswordCubit.confirmNewPasswordController.text!=resetPasswordCubit.createNewPasswordController.text) {
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
