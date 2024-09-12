import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class AccountScreenHeadline extends StatelessWidget {
  final String text;
  const AccountScreenHeadline({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.smallTextBlackColor)
        ));
  }
}
