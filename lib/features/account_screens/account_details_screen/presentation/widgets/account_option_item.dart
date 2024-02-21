import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class AccountOptionItem extends StatelessWidget {
  const AccountOptionItem(
      {super.key,
      required this.mainIcon,
      required this.title,
      this.optionalData,
      this.onTap});

  final String mainIcon;
  final String title;
  final Widget? optionalData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.iconsBackgroundColor,
                  borderRadius: BorderRadius.circular(4.r)),
              child: Transform.scale(
                scale: 0.5,
                child: SvgPicture.asset(
                  mainIcon,
                  height: 20.h,
                  width: 20.h,
                ),
              )),
          HorizontalSpace(16.w),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
          ),
          const Spacer(),
          if (optionalData != null) optionalData!,
          HorizontalSpace(5.w),
          Icon(Icons.keyboard_arrow_right, size: 27.r),
        ],
      ),
    );
  }
}
