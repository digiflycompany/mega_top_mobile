import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/your_order_list_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/data/product_model.dart';

class YourOrderList extends StatelessWidget {
  const YourOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: true,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: true,
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return Padding(
          padding: EdgeInsets.only(
              bottom: context.height * 0.022,
              left: context.width * 0.045,
              right: context.width * 0.045),
          child: YourOrderListContainer(
            productName: product.productName,
            productPhoto: product.productPhoto,
            productType: product.productType,
            productPrice: product.productPrice,
            discountPercent: product.discountPercent,
            discount: product.discount,
          ),
        );
      },
    );
  }
}
