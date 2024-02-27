import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class DoneCircle extends StatelessWidget {
  const DoneCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.h, // Specify the width of the circle
      height: 22.h, // Specify the height of the circle
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.primaryColor),
      child: Center(
        child: SvgPicture.asset(
          width: 12.w,
          height: 12.h,
          AppAssets.checkMediumIcon,
        ),
      ),
    );
  }
}
