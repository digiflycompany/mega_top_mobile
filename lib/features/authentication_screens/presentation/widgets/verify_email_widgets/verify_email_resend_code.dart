import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/small_circular_progress_indicator.dart';

class VerifyEmailResendCode extends StatelessWidget {
  final String email;
  const VerifyEmailResendCode({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return Row(
          children: [
            RowTextButton(
              firstText: AppStrings.ifYouDidNotRecCodeEn,
              buttonText: AppStrings.resendCodeEn,
              onTap: state is ResendResetPasswordCodeLoading?(){}:(){
                context.read<ResetPasswordCubit>().resendResetPassword(email);
              },
            ),
            HorizontalSpace(context.width4),
            state is ResendResetPasswordCodeLoading
                ? SmallCircularProgressIndicator()
                : SizedBox(),
          ],
        );
      },
    );
  }
}
