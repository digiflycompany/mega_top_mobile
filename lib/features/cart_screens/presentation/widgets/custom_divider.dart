import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({super.key, this.color=AppColors.smallContainerGreyColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:color,
      width: double.infinity,
      height: 1.h,
    );
  }
}
