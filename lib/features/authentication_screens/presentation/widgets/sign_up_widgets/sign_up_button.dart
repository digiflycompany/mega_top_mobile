import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/auth_button.dart';
import 'package:mega_top_mobile/core/widgets/button_circular_progress.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit signUpCubit = context.read<SignUpCubit>();
        return Padding(
          padding: EdgeInsets.only(bottom: context.height16),
          child: AuthButton(
            onTap: state is SignUpLoading
                ? () {}
                : () {
                    if (formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      signUpCubit.signUp(
                        signUpCubit.signUpFullNameController.text,
                        signUpCubit.signUpPhoneController.text,
                        signUpCubit.signUpEmailController.text,
                        signUpCubit.signUpEmailController.text,
                      );
                    }
                  },
            content: state is SignUpLoading
                ? const ButtonCircularProgress()
                : Text(
              AppLocalizations.of(context)!.signUp,
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
