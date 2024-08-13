import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';

class LatestSearchContainer extends StatelessWidget {
  final String? searchText;
  const LatestSearchContainer({super.key, this.searchText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.01),
      child: Container(
        width: double.infinity,
        height: context.height * 0.068,
        decoration: BoxDecoration(
          color: AppColors.circleAvatarBackground,
          borderRadius: BorderRadius.circular(context.height * 0.006),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
          child: Row(
            children: [
              Text(
                searchText!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppAssets.linkIcon)
            ],
          ),
        ),
      ),
    );
  }
}
