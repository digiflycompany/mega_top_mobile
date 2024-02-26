import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double topPadding;
  final double bottomPadding;
  const CustomDivider({super.key, this.color=AppColors.smallContainerGreyColor, this.topPadding=0, this.bottomPadding=0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding,bottom: bottomPadding),
      child: Container(
        color:color,
        width: double.infinity,
        height: 1.h,
      ),
    );
  }
}
