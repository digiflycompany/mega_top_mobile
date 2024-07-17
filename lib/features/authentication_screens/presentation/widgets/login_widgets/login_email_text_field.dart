import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/login_cubit/login_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/login_cubit/login_state.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit loginCubit = context.read<LoginCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: PrimaryTextField(
            controller: loginCubit.emailController,
            hintText: AppStrings.emailEn,
            prefixSvg: AppAssets.emailSecondIcon,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.pleaseEnterYourEmail;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
