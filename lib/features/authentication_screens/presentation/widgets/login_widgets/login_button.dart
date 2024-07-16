import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit loginCubit = context.read<AuthenticationCubit>();
        return Padding(
          padding: EdgeInsets.only(top: context.height40),
          child: AuthButton(
            onTap: state is LoginLoading
                ? () {}
                : () {
                    if (formKey.currentState!.validate()) {
                      final username = loginCubit.emailController.text;
                      final password = loginCubit.passwordController.text;
                      loginCubit.login(username, password);
                    }
                  },
            content: state is LoginLoading
                ? const ButtonCircularProgress()
                : Text(
                    AppStrings.loginEn,
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
