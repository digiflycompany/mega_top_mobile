import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome, ",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 16.sp)),
          Text(PreferencesHelper.getName,
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 16.sp)),
        ],
      ),
    );
  }
}
