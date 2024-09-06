import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/forgot_password_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordDescription extends StatelessWidget {
  const ResetPasswordDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height24),
      child: ForgotPasswordDescription(
        text: AppLocalizations.of(context)!.enterYourEmailAddress,
      ),
    );
  }
}
