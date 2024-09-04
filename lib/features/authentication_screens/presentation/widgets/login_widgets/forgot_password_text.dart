import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key,});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onTap: ()=>Routes.resetPasswordRoute.moveTo,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: context.width * 0.025,
              top: context.height * 0.009,
              bottom: context.height * 0.009),
          child: Text(
            AppLocalizations.of(context)!.forgotPassword,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
