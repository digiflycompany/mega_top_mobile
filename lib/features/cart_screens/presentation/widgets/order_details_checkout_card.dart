import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/order_details_checkout_description.dart';

import 'card_title_text.dart';
import 'custom_divider.dart';

class OrderDetailsCheckoutCard extends StatelessWidget {
  final String productPrice;
  final String productQuantity;
  final String totalPrice;
  const OrderDetailsCheckoutCard({
    super.key,
    required this.productPrice,
    required this.productQuantity,
    required this.totalPrice
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.033),
      child: Container(
        width: double.infinity,
        height: context.height * 0.24,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
          Border.all(width: 1.w, color: AppColors.smallContainerGreyColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardTitleText(title: AppStrings.orderDetailsEn,),
              const CustomDivider(),
              OrderDetailsCheckoutDescription(
                productPrice: productPrice,
                productQuantity: productQuantity,
                totalPrice: totalPrice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
