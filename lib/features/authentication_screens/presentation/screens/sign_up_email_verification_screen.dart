import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/email_verification_cubit/email_verification_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/email_verification_cubit/email_verification_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/otp_row.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/please_enter_four_digits_code_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/resend_code_row.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/user_email_text.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/sign_up_widgets/verify_email_button.dart';

class SignUpEmailVerificationScreen extends StatefulWidget {
  const SignUpEmailVerificationScreen({super.key});

  @override
  State<SignUpEmailVerificationScreen> createState() =>
      _SignUpEmailVerificationScreenState();
}

class _SignUpEmailVerificationScreenState
    extends State<SignUpEmailVerificationScreen> {
  late EmailVerificationCubit emailVerificationCubit;
  @override
  void initState() {
    super.initState();
    emailVerificationCubit = context.read<EmailVerificationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) =>emailVerificationCubit.handleSignUpEmailVerificationState(context, state),
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, context.height * 0.089),
              child: const CustomAppBar(AppStrings.verifyYourEmailEn)),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PleaseEnterFourDigitsCodeText(),
                UserEmailText(),
                OTPEmailVerificationRow(),
                VerifyEmailButton(),
                ResendCodeRow(),
              ],
            ),
          ),
        );
      },
    );
  }
}
