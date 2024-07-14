import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit signUpCubit = context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height16),
          child: AuthButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                final email = signUpCubit.signUpEmailController.text;
                final username = signUpCubit.signUpFullNameController.text;
                final password = signUpCubit.signUpPasswordController.text;
                final confirmPassword = signUpCubit.signUpConfirmPasswordController.text;
                signUpCubit.signUp(email, username, password, confirmPassword);
              }
            },
            content: state is SignUpLoading?const ButtonCircularProgress():Text(
              AppStrings.signUpEn,
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
