import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class SignUpUserNameTextField extends StatelessWidget {
  const SignUpUserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit signUpCubit = context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: PrimaryTextField(
            controller: signUpCubit.signUpUsernameController,
            hintText: AppStrings.usernameEn,
            prefixSvg: AppAssets.usernameIcon,
            max: 30,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.pleaseEnterYourUserName;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
