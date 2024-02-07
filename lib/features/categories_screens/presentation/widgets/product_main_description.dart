import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/available_container.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_category.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_detailed_small_description.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_name.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/product_prices.dart';

class ProductMainDescription extends StatelessWidget {
  const ProductMainDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:context.height*0.033 ),
      child: Column(
        children: [
          /// Product Details Row ////
          Row(
            children: [
              const ProductDetailedNameText(name: AppStrings.upsVersion1En,),
              const Spacer(),
              const AvailableContainer(),
              HorizontalSpace(context.width*0.022),
              DiscountContainer(
                width: context.width*0.118,
                height: context.height*0.033,
                discountPercent: AppStrings.discountPercentEn,
              )
            ],
          ),
          VerticalSpace(context.height*0.011),
          const ProductDetailedCategory(
            category: AppStrings.storageUnitsEn,
          ),
          VerticalSpace(context.height*0.022),
          const ProductPrices(
           oldPrice: AppStrings.productOldPriceEn,
           currentPrice: AppStrings.productPriceEn,
         ),
          VerticalSpace(context.height*0.029),
          const ProductDetailedSmallDescription(description: AppStrings.productDetailedSmallDescriptionEn,)
        ],
      ),
    );
  }
}
