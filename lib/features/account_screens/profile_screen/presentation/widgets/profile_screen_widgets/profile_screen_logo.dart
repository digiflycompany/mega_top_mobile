import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';

class ProfileScreenLogo extends StatelessWidget {
  const ProfileScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h,bottom: 35.h),
      child: Image.asset(
        AppAssets.megaTopLogo,
        width: 120.w,
        height: 80.h,
      ),
    );
  }
}
