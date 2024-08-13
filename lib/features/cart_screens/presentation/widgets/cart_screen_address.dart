import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class CartScreenAddress extends StatelessWidget {
  const CartScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.045,vertical: context.height * 0.028),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Location Icon
          SvgPicture.asset(AppAssets.locationBlackIcon),
          HorizontalSpace(context.width * 0.022),

          /// Address ///
          Text(
            AppStrings.addressInCartEn,
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
