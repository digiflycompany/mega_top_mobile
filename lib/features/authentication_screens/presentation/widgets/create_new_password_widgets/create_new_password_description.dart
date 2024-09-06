import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateNewPasswordDescription extends StatelessWidget {
  const CreateNewPasswordDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordDescription(
      text: AppLocalizations.of(context)!.setYourNewPassword,
    );
  }
}
