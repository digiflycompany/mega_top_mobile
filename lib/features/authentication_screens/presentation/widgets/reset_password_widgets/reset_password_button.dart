import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ResetPasswordButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        ResetPasswordCubit resetCubit = context.read<ResetPasswordCubit>();
        return AuthButton(
          content: state is ResetPasswordLoading?const ButtonCircularProgress():Text(
            AppLocalizations.of(context)!.send,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          onTap: state is ResetPasswordLoading?(){}:() {
            if(formKey.currentState!.validate()){
              FocusManager.instance.primaryFocus?.unfocus();
              resetCubit.resetPassword(resetCubit.resetPasswordEmailController.text);
            }
          },
        );
      },
    );
  }
}
