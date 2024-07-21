import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_state.dart';

class ResetPasswordEmailField extends StatelessWidget {
  const ResetPasswordEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit resetCubit = context.read<ResetPasswordCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height40),
          child: PrimaryTextField(
            hintText: AppStrings.emailEn,
            prefixSvg: AppAssets.emailSecondIcon,
            controller: resetCubit.resetPasswordEmailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterYourEmail;
              } else if (!resetCubit.emailRegex.hasMatch(value)) {
                return AppStrings.pleaseEnterValidEmail;
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
