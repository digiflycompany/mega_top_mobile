import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/spacer.dart';

class AvailableContainer extends StatelessWidget {
  const AvailableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width*0.2,
      height: context.height*0.033,
      decoration: BoxDecoration(
          color:AppColors.smallContainerGreyColor,
          borderRadius: BorderRadius.circular(context.height*0.003)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.smallCheckIcon),
          HorizontalSpace(context.width*0.011),
          Text(
            AppStrings.availableEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 11.sp
            ),
          )
        ],
      ),
    );
  }
}
