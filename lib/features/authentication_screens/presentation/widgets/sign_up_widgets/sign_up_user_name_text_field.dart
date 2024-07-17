import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/sign_up_cubit/sign_up_state.dart';

class SignUpFullNameTextField extends StatelessWidget {
  const SignUpFullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit signUpCubit = context.read<SignUpCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: PrimaryTextField(
            controller: signUpCubit.signUpFullNameController,
            hintText: AppStrings.fullNameEn,
            prefixSvg: AppAssets.usernameIcon,
            max: 30,
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.pleaseEnterYourFullName;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
