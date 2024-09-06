import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_otp.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_resend_code.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/verify_email_widgets/verify_email_reset_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  late ResetPasswordCubit resetPasswordCubit;
  @override
  void initState() {
    resetPasswordCubit = context.read<ResetPasswordCubit>();
    resetPasswordCubit.initializeControllers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) => resetPasswordCubit.handleVerifyingEmailStates(context,state),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, context.height * 0.089),
              child: CustomAppBar(AppLocalizations.of(context)!.verifyYourEmail)),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VerifyEmailCondition(),
                    VerifyEmailDescription(email: widget.email,),
                    const VerifyEmailOtp(),
                    VerifyEmailResetPasswordButton(email: widget.email,),
                    VerifyEmailResendCode(email: widget.email,),
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
    resetPasswordCubit.disposeControllers();
    super.dispose();
  }
}
