import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/reset_password_widgets/reset_password_email_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late AuthenticationCubit authenticationCubit;
  @override
  void initState() {
    // TODO: implement initState
    authenticationCubit = context.read<AuthenticationCubit>();
    authenticationCubit.initializeControllers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is ResetPasswordSuccess){
           Routes.verifyEmailRoute.moveTo;
        }
        if(state is ResetPasswordFailure){
          authenticationCubit.showErrorToast(context, '',AppStrings.userNotFoundWithProvidedEmail);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, context.height * 0.089),
              child: const CustomAppBar(AppStrings.resetPasswordEn)),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ResetPasswordCondition(),
                    const ResetPasswordDescription(),
                    const ResetPasswordEmailField(),
                    ResetPasswordButton(formKey: _formKey,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
