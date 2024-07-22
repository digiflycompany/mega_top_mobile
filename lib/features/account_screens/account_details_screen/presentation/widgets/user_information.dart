import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h,bottom: 40.h),
      child: Row(
        children: [
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
      ),
    );
  }
}
