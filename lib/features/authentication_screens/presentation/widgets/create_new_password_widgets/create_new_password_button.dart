import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_state.dart';

class CreateNewPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CreateNewPasswordButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit resetPasswordCubit = context.read<ResetPasswordCubit>();
        return AuthButton(
          content: state is UpdatePasswordLoading ? const ButtonCircularProgress():Text(
            AppStrings.confirmPasswordEn,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: () {
            if(formKey.currentState!.validate()){
               resetPasswordCubit.updatePassword(
                   resetPasswordCubit.otp,
                   resetPasswordCubit.resetPasswordEmailController.text,
                   resetPasswordCubit.createNewPasswordController.text,
                   resetPasswordCubit.confirmNewPasswordController.text
               );
            }
          },
        );
      },
    );
  }
}
