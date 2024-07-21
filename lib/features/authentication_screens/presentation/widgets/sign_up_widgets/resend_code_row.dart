import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/email_verification_cubit/email_verification_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/email_verification_cubit/email_verification_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/small_circular_progress_indicator.dart';

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: context.height12),
          child: Row(
            children: [
              RowTextButton(
                firstText: AppStrings.ifYouDidNotRecCodeEn,
                buttonText: AppStrings.resendCodeEn,
                onTap: state is EmailVerificationResendCodeLoading
                    ? () {}
                    : () {
                        context.read<EmailVerificationCubit>().resendEmailCode();
                      },
              ),
              HorizontalSpace(context.width4),
              state is EmailVerificationResendCodeLoading
                  ? SmallCircularProgressIndicator()
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
