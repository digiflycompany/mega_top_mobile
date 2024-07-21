import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/custom_app_bar.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/confirm_new_password_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_condition.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_description.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/create_new_password_widgets/create_new_password_text_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  late ResetPasswordCubit resetPasswordCubit;
  @override
  void initState() {
    super.initState();
    resetPasswordCubit = context.read<ResetPasswordCubit>();
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
         resetPasswordCubit = context.read<ResetPasswordCubit>();
        if(state is UpdatePasswordSuccess){
          resetPasswordCubit.passwordChangedSuccessfully(context);
        }
        if(state is UpdatePasswordFailure){
          resetPasswordCubit.showErrorToast(context, '',AppStrings.invalidOtp);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, context.height * 0.089),
              child: const CustomAppBar(AppStrings.createNewPasswordEn)),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CreateNewPasswordCondition(),
                    const CreateNewPasswordDescription(),
                    const CreateNewPasswordTextField(),
                    const ConfirmNewPasswordTextField(),
                    CreateNewPasswordButton(formKey: _formKey,),
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
