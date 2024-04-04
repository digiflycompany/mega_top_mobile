import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/data/models/product_model.dart';
import 'cart_items_container.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        productName: AppStrings.upsVersion1En,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: true,
      ),
      Product(
        productName: AppStrings.upsVersion1En,
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
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.only(
                right: context.width * 0.011,
                left: context.width * 0.011,
                bottom: context.height * 0.027,
                top: context.height * 0.006),
            child: CartItemsContainer(
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
