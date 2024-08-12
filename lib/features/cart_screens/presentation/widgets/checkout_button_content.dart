import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

class CheckoutButtonContent extends StatelessWidget {
  const CheckoutButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Product Quantity
        // Text(
        //   AppStrings.productsQuantityEn,
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 14.sp,
        //   ),
        // ),
        // HorizontalSpace(context.width * 0.011),
        //
        // /// Products Text
        // Text(
        //   AppStrings.products2En,
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.w500,
        //     fontSize: 14.sp,
        //   ),
        // ),
        // HorizontalSpace(context.width * 0.022),
        //
        // /// Product Price
        // Text(
        //   AppStrings.threeThousand,
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w700,
        //       fontSize: 14.sp),
        // ),
        const Spacer(),
        /// Product Checkout
        Text(
          AppStrings.checkoutEn,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
        HorizontalSpace(context.width * 0.022),

        /// Arrow Icon
        SvgPicture.asset(AppAssets.arrowButton),
      ],
    );
  }
}
