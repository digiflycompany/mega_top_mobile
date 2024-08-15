import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/dotted_line.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/total_price_amount_row.dart';
import 'number_of_products_row.dart';

class OrderDetailsCheckoutDescription extends StatelessWidget {
  final String? productPrice;
  final String productQuantity;
  final String? totalPrice;
  const OrderDetailsCheckoutDescription({super.key,
    required this.productPrice,
    required this.productQuantity,
    required this.totalPrice
  });

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
            NumberOfProductsRow(
              productPrice: productPrice,
              productQuantity: productQuantity,
            ),
            VerticalSpace(context.height * 0.025),
            const DottedLine(),
            const Spacer(),
            TotalPriceAmountRow(
              totalAmount: totalPrice,
            )
          ],
        ),
      ),
    );
  }
}
