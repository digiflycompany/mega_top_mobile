import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class LoginOrContinueColumn extends StatelessWidget {
  const LoginOrContinueColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.welcomeToMegaTopEn,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        VerticalSpace(context.height * 0.022),
        Text(
          AppStrings.loginOrCreateEnEn,
          style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
