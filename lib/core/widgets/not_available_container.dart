import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/spacer.dart';

class NotAvailableContainer extends StatelessWidget {
  const NotAvailableContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w
      ),
      height: context.height * 0.033,
      decoration: BoxDecoration(
          color: AppColors.smallContainerGreyColor,
          borderRadius: BorderRadius.circular(context.height * 0.003)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.outOfStockEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 11.sp),
          )
        ],
      ),
    );
  }
}
