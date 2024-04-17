import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          height: 60.h,
          width: 60.h,
          child: ClipOval(
            child: SvgPicture.asset(
              AppAssets.guestIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        HorizontalSpace(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(PreferencesHelper.getName,
                style: TextStyle(fontWeight: FontWeight.w700)),
            Text(PreferencesHelper.getEmail,
                style: TextStyle(color: AppColors.greyTextColor)),
          ],
        ),
      ],
    );
  }
}
