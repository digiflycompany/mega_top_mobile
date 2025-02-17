import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/primary_text_field.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpEmailTextField extends StatelessWidget {
  const SignUpEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      SignUpCubit signUpCubit = context.read<SignUpCubit>();
      return Padding(
          padding: EdgeInsets.only(bottom: context.height24),
          child: PrimaryTextField(
              inputType: TextInputType.emailAddress,
              controller: signUpCubit.signUpEmailController,
              hintText: AppLocalizations.of(context)!.email,
              prefixSvg: AppAssets.emailSecondIcon,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterYourEmail;
                } else if (!signUpCubit.emailRegex.hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .pleaseEnterValidEmailAddress;
                }
                return null;
              }));
    });
  }
}