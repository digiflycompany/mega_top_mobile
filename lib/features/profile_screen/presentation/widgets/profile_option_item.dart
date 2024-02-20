import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class ProfileOptionItem extends StatelessWidget {
  const ProfileOptionItem({
    super.key,
    required this.title,
    required this.mainIcon,
  });

  final String mainIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(mainIcon, width: 24.w, height: 24.h),
          HorizontalSpace(7.h),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
          ),
          const Spacer(),
          Icon(Icons.keyboard_arrow_right, size: 25.r),
        ],
      ),
    );
  }
}
