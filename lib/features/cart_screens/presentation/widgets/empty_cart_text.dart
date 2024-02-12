import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/utils/app_string.dart';

class EmptyCartText extends StatelessWidget {
  const EmptyCartText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.yourShoppingCartIsEmptyEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp
          ),
        ),
        VerticalSpace(context.height*0.033),
        Text(
          AppStrings.browseProductsLongTextEn,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 13.5.sp
          ),
        ),
      ],
    );
  }
}
