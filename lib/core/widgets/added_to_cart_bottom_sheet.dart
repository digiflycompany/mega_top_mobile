import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
              child: const Column(
                children: [
                  PrimaryButton(
                    text: AppStrings.viewCartEn,
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
