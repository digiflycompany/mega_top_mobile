import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/row_two_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height16),
      child: RowTextButton(
        firstText: AppLocalizations.of(context)!.doNotHaveAnAccount,
        buttonText: AppLocalizations.of(context)!.signUp,
        onTap: () {
          Routes.signUpRoute.moveTo;
        },
      ),
    );
  }
}
