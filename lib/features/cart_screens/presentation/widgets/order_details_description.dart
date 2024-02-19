import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

import 'number_of_products_row.dart';

class OrderDetailsDescription extends StatelessWidget {
  const OrderDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height*0.02,right: context.width*0.045,left: context.width*0.045),
      child: const Column(
        children: [
          NumberOfProductsRow(
            productPrice: AppStrings.threeThousandEn,
            productQuantity: AppStrings.twoProductsEn,
          )
        ],
      ),
    );
  }
}
