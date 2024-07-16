import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
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
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    super.initState();
    authenticationCubit = context.read<AuthenticationCubit>();
    authenticationCubit.initializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is EmailVerifiedSuccess) {
          Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
        }
        if (state is EmailVerifiedFailure) {
          authenticationCubit.showErrorToast(
              context, AppStrings.emailVerificationFailed, state.error);
        }
        if (state is EmailResendCodeFailure) {
          authenticationCubit.showErrorToast(
              context, AppStrings.sendingCodeFailed, state.error);
        }
      },
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
                OTPRow(),
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
