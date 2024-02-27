import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/product_list_card.dart';
import 'package:mega_top_mobile/features/home_screens/data/product_model.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
    ];
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(
                end: context.width * 0.011,
                ),
            child: ProductsListCard(
              productName: product.productName,
              productPhoto: product.productPhoto,
              productType: product.productType,
              productPrice: product.productPrice,
              discountPercent: product.discountPercent,
              discount: product.discount,
            ),
          );
        },
      ),
    );
  }
}
