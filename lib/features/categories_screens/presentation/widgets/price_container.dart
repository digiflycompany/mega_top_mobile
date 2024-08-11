import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/price_text_field.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key, required this.minPriceController, required this.maxPriceController});

  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            AppStrings.priceBottomSheetEn,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ),
        ),
        VerticalSpace(context.height * 0.032),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.fromEn,
              style: TextStyle(
                  color: AppColors.smallTextBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            Expanded(
              child: Center(
                child: Text(
                  AppStrings.toEn,
                  style: TextStyle(
                      color: AppColors.smallTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp),
                ),
              ),
            )
          ],
        ),
        VerticalSpace(context.height * 0.022),
        Row(
          children: [
            PriceTextField(price: minPriceController),
            Spacer(),
            PriceTextField(price: maxPriceController),
          ],
        ),
      ],
    );
  }
}
