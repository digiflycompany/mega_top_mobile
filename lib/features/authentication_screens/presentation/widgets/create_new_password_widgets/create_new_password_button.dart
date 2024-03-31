import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';

class CreateNewPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CreateNewPasswordButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        AuthenticationCubit authenticationCubit = context.read<AuthenticationCubit>();
        return PrimaryButton(
          text: AppStrings.confirmPasswordEn,
          onTap: () {
            if(formKey.currentState!.validate()){
              authenticationCubit.passwordSuccess();
              authenticationCubit.passwordChangedSuccessfully(context);
            }
          },
        );
      },
    );
  }
}
