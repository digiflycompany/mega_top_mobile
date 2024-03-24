import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class UserEmailText extends StatelessWidget {
  const UserEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height6,bottom: context.height24),
      child: Text(
        AppStrings.userEmail,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
        ),
      ),
    );
  }
}
