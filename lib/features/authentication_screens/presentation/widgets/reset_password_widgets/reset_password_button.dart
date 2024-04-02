import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class ResetPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ResetPasswordButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit resetCubit = context.read<AuthenticationCubit>();
        return AuthButton(
          content: state is ResetPasswordLoading?const ButtonCircularProgress():Text(
            AppStrings.sendEn,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: () {
            if(formKey.currentState!.validate()){
              resetCubit.resetPassword(resetCubit.resetPasswordEmailController.text);
            }
          },
        );
      },
    );
  }
}