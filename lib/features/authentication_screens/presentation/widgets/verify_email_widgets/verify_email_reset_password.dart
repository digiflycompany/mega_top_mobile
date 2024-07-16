import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class VerifyEmailResetPasswordButton extends StatelessWidget {
  final String email;
  const VerifyEmailResetPasswordButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit cubit =context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: AuthButton(
              onTap: (){
                cubit.verifyResetPassword(email, cubit.otp);
              },
            content: state is VerifyResetPasswordLoading?ButtonCircularProgress():Text(
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
