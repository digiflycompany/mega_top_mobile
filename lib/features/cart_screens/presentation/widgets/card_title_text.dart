import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_color.dart';

class CardTitleText extends StatelessWidget {
  final String? title;
  const CardTitleText({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: context.height * 0.022, left: context.width * 0.045),
      child: Text(
        title!,
        style: TextStyle(
            color: AppColors.smallTextBlackColor,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp),
      ),
    );
  }
}
