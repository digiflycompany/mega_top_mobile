import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyEmailResetPasswordButton extends StatelessWidget {
  final String email;
  const VerifyEmailResetPasswordButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit cubit =context.read<ResetPasswordCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: AuthButton(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
                cubit.verifyResetPassword(email, cubit.otp);
              },
            content: state is VerifyResetPasswordLoading?ButtonCircularProgress():Text(
              AppLocalizations.of(context)!.verify,
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
