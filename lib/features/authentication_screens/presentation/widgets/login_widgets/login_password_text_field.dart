import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit loginCubit = context.read<LoginCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: PasswordTextField(
            controller: loginCubit.passwordController,
            hintText: AppLocalizations.of(context)!.password,
            prefixSvg: AppAssets.passwordIcon,
            isPasswordVisible: loginCubit.isPasswordVisible,
            togglePassword: ()=>loginCubit.togglePasswordVisibility(),
            validator: (value) {
              if (value!.isEmpty) {
                return AppLocalizations.of(context)!.pleaseEnterYourPassword;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
