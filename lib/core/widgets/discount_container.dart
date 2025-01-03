import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../utils/app_color.dart';

class DiscountContainer extends StatelessWidget {
  final String? discountPercent;
  final double? width;
  final double? height;
  final double? fontSize;
  const DiscountContainer(
      {super.key,
      this.discountPercent,
      this.width,
      this.height,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: width,
       height: height,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.010),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height * 0.003),
        color: AppColors.redIconColor,
      ),
      child: Center(
        child: Text(
          discountPercent!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 12.sp,
          ),
        ),
      ),
    );
  }
}
