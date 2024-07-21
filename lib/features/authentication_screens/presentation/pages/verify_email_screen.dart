import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_otp.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_resend_code.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_reset_password.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    authenticationCubit = context.read<AuthenticationCubit>();
    authenticationCubit.initializeControllers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if(state is VerifyResetPasswordSuccess){
          Routes.createNewPasswordRoute.moveTo;
        }
        if(state is VerifyResetPasswordFailure){
          authenticationCubit.showErrorToast(
              context, AppStrings.emailVerificationFailed, state.error);
        }
        if(state is ResetPasswordNoInternetConnection){
          authenticationCubit.showErrorToast(
              context, AppStrings.emailVerificationFailed, AppStrings.noInternetConnectionPlease);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, context.height * 0.089),
              child: const CustomAppBar(AppStrings.verifyYourEmailEn)),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VerifyEmailCondition(),
                    const VerifyEmailDescription(),
                    const VerifyEmailOtp(),
                    VerifyEmailResetPasswordButton(email: widget.email,),
                    const VerifyEmailResendCode(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    authenticationCubit.disposeControllers();
    super.dispose();
  }
}
