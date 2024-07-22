import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/email_verification_cubit/email_verification_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/email_verification_cubit/email_verification_state.dart';

class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        EmailVerificationCubit buttonCubit = context.read<EmailVerificationCubit>();
        return Padding(
          padding: EdgeInsets.only(top: context.height40),
          child: AuthButton(
            onTap: state is EmailVerificationLoading
                ? () {}
                : () {
              FocusManager.instance.primaryFocus?.unfocus();
              buttonCubit.emailVerification(
                      buttonCubit.otp,
                    );
                  },
            content: state is EmailVerificationLoading
                ? const ButtonCircularProgress()
                : Text(
                    AppStrings.verifyEn,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
