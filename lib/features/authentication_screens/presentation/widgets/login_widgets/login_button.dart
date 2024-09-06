import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/login_cubit/login_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit loginCubit = context.read<LoginCubit>();
        return Padding(
          padding: EdgeInsets.only(top: context.height40),
          child: AuthButton(
            onTap: state is LoginLoading
                ? () {}
                : () {
                    if (formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final username = loginCubit.emailController.text;
                      final password = loginCubit.passwordController.text;
                      loginCubit.login(username, password);
                    }
                  },
            content: state is LoginLoading
                ? const ButtonCircularProgress()
                : Text(
              AppLocalizations.of(context)!.login,
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
