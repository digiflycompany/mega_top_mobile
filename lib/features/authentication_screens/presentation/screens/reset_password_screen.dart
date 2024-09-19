import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_email_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
        listener: (context, state) =>
            resetPasswordCubit.handleResetPasswordStates(context, state),
        builder: (context, state) {
          return Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size(double.infinity, context.height * 0.089),
                  child: CustomAppBar(
                      AppLocalizations.of(context)!.resetPassword)),
              body: Form(
                  key: _formKey,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.width16),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        const ResetPasswordCondition(),
                        const ResetPasswordDescription(),
                        const ResetPasswordEmailField(),
                        ResetPasswordButton(formKey: _formKey)
                      ])))));
        });
  }

  @override
  void dispose() {
    resetPasswordCubit.disposeControllers();
    super.dispose();
  }
}