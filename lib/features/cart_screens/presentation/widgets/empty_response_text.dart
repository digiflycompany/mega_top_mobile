import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class EmptyResponseText extends StatelessWidget {
  final String? bigFontText;
  final String? smallFontText;
  const EmptyResponseText({super.key,this.bigFontText, this.smallFontText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bigFontText!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp
          ),
        ),
        VerticalSpace(context.height*0.033),
        Text(
          smallFontText!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 13.5.sp
          ),
        ),
      ],
    );
  }
}
