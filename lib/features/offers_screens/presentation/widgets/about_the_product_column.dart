import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class AboutTheProductColumn extends StatelessWidget {
  const AboutTheProductColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// About The Product Text ///
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppStrings.aboutTheProductEn,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
        ),
        VerticalSpace(context.height * 0.021),
        Divider(
          thickness: context.width * 0.003,
          color: AppColors.smallContainerGreyColor,
        ),
        VerticalSpace(context.height * 0.021),

        /// About The Product Description ///
        Text(
          AppStrings.aboutProductDescriptionEn,
          style: TextStyle(
              color: AppColors.smallTextBlackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        )
      ],
    );
  }
}
