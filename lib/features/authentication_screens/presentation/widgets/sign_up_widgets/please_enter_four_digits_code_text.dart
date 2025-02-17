import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PleaseEnterFourDigitsCodeText extends StatelessWidget {
  const PleaseEnterFourDigitsCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(top: context.height40),
      child: Text(
        AppLocalizations.of(context)!.pleaseEnterTheFourDigitsSentTo,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp
        ),
      ),
    );
  }
}
