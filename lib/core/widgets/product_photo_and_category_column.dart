import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/spacer.dart';

class ProductPhotoAndCategoryColumn extends StatelessWidget {
  final String? productImage;
  final String? productCategory;
  const ProductPhotoAndCategoryColumn(
      {super.key, this.productImage, this.productCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Added To Product Text ///
        Text(
          AppStrings.theProductAddedToCartEn,
          style: TextStyle(
              color: AppColors.primaryGreenColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Product Photo ///
            Image.asset(
              productImage!,
              height: context.width * 0.066,
            ),
            HorizontalSpace(context.width * 0.04),

            /// Product Category ///
            Text(
              productCategory!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            )
          ],
        )
      ],
    );
  }
}
