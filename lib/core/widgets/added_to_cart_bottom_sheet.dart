import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';
import 'cart_bottom_sheet_product_details.dart';

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height*0.407,
        color: Colors.white,
        child: Column(
          children: [
            const CartBottomSheetProductDetails(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PrimaryButton(
                      text: AppStrings.viewCartEn,
                    ),
                    VerticalSpace(context.height*0.033),
                    /// Continue Shopping Button
                    PrimaryEmptyButton(
                        onTap: () =>Navigator.pop(context),
                        text: AppStrings.continueShoppingEn,
                        horizontalPadding: 0
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
