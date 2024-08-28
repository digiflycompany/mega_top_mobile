import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class CardTitleText extends StatelessWidget {
  final String? title;
  const CardTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: context.height * 0.022, start: context.width * 0.045),
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
