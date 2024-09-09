import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductPhotoAndCategoryColumn extends StatelessWidget {
  const ProductPhotoAndCategoryColumn(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Added To Product Text ///
        Text(
          AppLocalizations.of(context)!.productAddedToCart,
          style: TextStyle(
              color: AppColors.primaryGreenColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
      ],
    );
  }
}
