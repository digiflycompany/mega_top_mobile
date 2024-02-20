import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

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
            child: Image.asset(
              AppAssets.customerProfilePhoto,
              fit: BoxFit.cover,
            ),
          ),
        ),
        HorizontalSpace(10.w),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.userName,
                style: TextStyle(fontWeight: FontWeight.w700)),
            Text(AppStrings.userEmail,
                style: TextStyle(color: AppColors.greyTextColor)),
          ],
        ),
      ],
    );
  }
}
