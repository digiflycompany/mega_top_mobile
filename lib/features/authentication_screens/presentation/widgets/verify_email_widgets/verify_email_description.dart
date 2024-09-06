import 'package:flutter/material.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerifyEmailDescription extends StatelessWidget {
  final String email;
  const VerifyEmailDescription({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            ForgotPasswordDescription(
              text: AppLocalizations.of(context)!.pleaseEnterTheFourDigitsSentTo,
            ),
            ForgotPasswordDescription(
              text: email,
            ),
          ],
        );
  }
}
