import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpConfirmPasswordTextField extends StatelessWidget {
  const SignUpConfirmPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit signUpCubit = context.read<SignUpCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height40),
          child: PasswordTextField(
            controller: signUpCubit.signUpConfirmPasswordController,
            hintText: AppLocalizations.of(context)!.confirmPassword,
            prefixSvg: AppAssets.passwordIcon,
            isPasswordVisible: signUpCubit.isPasswordVisible,
            togglePassword: ()=>signUpCubit.togglePasswordVisibility(),
            validator: (value)=>signUpCubit.validateConfirmPassword(value??'', context),
          ),
        );
      },
    );
  }
}
