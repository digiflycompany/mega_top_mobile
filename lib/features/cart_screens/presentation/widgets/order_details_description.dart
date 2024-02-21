import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/dotted_line.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/shipping_fees_row.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/total_price_amount_row.dart';

import 'number_of_products_row.dart';

class OrderDetailsDescription extends StatelessWidget {
  const OrderDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: context.height * 0.015,
            right: context.width * 0.045,
            left: context.width * 0.045),
        child: Column(
          children: [
            const NumberOfProductsRow(
              productPrice: AppStrings.threeThousandEn,
              productQuantity: AppStrings.twoProductsEn,
            ),
            VerticalSpace(context.height * 0.02),
            const ShippingFeesRow(
              shippingFees: AppStrings.twentyEn,
            ),
            VerticalSpace(context.height * 0.025),
            const DottedLine(),
            const Spacer(),
            const TotalPriceAmountRow(
              totalAmount: AppStrings.threeThousandTwentyEn,
            )
          ],
        ),
      ),
    );
  }
}
