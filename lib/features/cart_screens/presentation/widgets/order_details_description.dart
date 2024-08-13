import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/dotted_line.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/total_price_amount_row.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

import 'number_of_products_row.dart';

class OrderDetailsDescription extends StatelessWidget {
  const OrderDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final cartSummary = PreferencesHelper.getCartSummary();
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: context.height * 0.015,
            right: context.width * 0.045,
            left: context.width * 0.045),
        child: Column(
          children: [
             NumberOfProductsRow(
              productPrice: "${cartSummary['totalPrice']}",
              productQuantity: "${cartSummary['totalItems']}",
            ),
            // VerticalSpace(context.height * 0.02),
            // const ShippingFeesRow(
            //   shippingFees: AppStrings.twentyEn,
            // ),
            VerticalSpace(context.height * 0.025),
            const DottedLine(),
            const Spacer(),
            TotalPriceAmountRow(
              totalAmount: "${cartSummary['totalPrice']}",
            )
          ],
        ),
      ),
    );
  }
}
