import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';

class ProductPhotoAndCategoryColumn extends StatelessWidget {
  final String? productImage;
  final String? productCategory;
  const ProductPhotoAndCategoryColumn(
      {super.key, this.productImage, this.productCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Added To Product Text ///
        Text(
          AppStrings.theProductAddedToCartEn,
          style: TextStyle(
              color: AppColors.primaryGreenColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
      ],
    );
  }
}
