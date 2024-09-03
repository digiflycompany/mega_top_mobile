import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerName extends StatelessWidget {
  final String? name;
  const CustomerName({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12.sp),
        ),
        VerticalSpace(1.h),
        Text(
          AppLocalizations.of(context)!.welcomeHomeScreen,
          style: TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp),
        ),
      ],
    );
  }
}
