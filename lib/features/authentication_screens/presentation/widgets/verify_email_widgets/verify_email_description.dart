import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';

class VerifyEmailDescription extends StatelessWidget {
  const VerifyEmailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit userCubit = context.read<ResetPasswordCubit>();
        return Column(
          children: [
            const ForgotPasswordDescription(
              text: AppStrings.pleaseEnter4DigitsEn,
            ),
            ForgotPasswordDescription(
              text: '${userCubit.resetPasswordEmailController.text}',
            ),
          ],
        );
      },
    );
  }
}
