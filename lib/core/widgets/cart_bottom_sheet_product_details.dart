import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_and_category_column.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/spacer.dart';
import 'animated_check_sign_circle.dart';

class CartBottomSheetProductDetails extends StatelessWidget {
  const CartBottomSheetProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.144,
      decoration: BoxDecoration(
        color: AppColors.addToCartBottomSheetBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.addToCartBottomSheetBorderColor,
            width: 1.w,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.045,
            vertical: context.height * 0.033),
        child: Row(
          children: [
            const AnimatedCheckSignCircle(),
            HorizontalSpace(context.width * 0.045),
            const ProductPhotoAndCategoryColumn(
              productImage: AppAssets.productBigPhoto,
              productCategory: AppStrings.upsVersion1En,
            ),
          ],
        ),
      ),
    );
  }
}
