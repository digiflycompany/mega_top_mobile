import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class LoginOrContinueColumn extends StatelessWidget {
  const LoginOrContinueColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.welcomeToMegaTop,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        VerticalSpace(context.height * 0.022),
        Text(
          AppLocalizations.of(context)!.loginOrCreateNewAccount,
          style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
