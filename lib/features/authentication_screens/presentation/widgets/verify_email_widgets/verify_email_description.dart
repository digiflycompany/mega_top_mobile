import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';

class VerifyEmailDescription extends StatelessWidget {
  const VerifyEmailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit userCubit = context.read<AuthenticationCubit>();
        return Column(
          children: [
            const ForgotPasswordDescription(
              text: AppStrings.pleaseEnter4DigitsEn,
            ),
            ForgotPasswordDescription(
              text: '${userCubit.resetPasswordEmailController!.text}',
            ),
          ],
        );
      },
    );
  }
}
