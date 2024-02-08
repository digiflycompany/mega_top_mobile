import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';

class ProductDetailedCategory extends StatelessWidget {
  final String? category;
  const ProductDetailedCategory({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        category!,
        style:  TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
          color: AppColors.greyTextColor,
        ),
      ),
    );
  }
}
