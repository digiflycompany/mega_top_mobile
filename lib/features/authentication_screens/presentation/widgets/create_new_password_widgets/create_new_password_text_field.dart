import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateNewPasswordTextField extends StatelessWidget {
  const CreateNewPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit resetPasswordCubit = context.read<ResetPasswordCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: context.height24),
          child: PasswordTextField(
            controller: resetPasswordCubit.createNewPasswordController,
            hintText: AppLocalizations.of(context)!.enterYourNewPassword,
            prefixSvg: AppAssets.passwordIcon,
            isPasswordVisible: resetPasswordCubit.isPasswordVisible,
            togglePassword: ()=>resetPasswordCubit.togglePasswordVisibility(),
            validator: (value) =>resetPasswordCubit.validatePassword(value, context),
          ),
        );
      },
    );
  }
}
