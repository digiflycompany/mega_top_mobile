import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../data/product_model.dart';
import 'items_grid.dart';

class SearchResultGrid extends StatelessWidget {
  const SearchResultGrid({super.key});

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
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.storageUnitsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: true,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.storageUnitsSearchResult,
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
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: true,
      ),
    ];
    return Expanded(
      child: GridView.builder(
         physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.width * 0.027,
          mainAxisSpacing: context.height * 0.012,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return  Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width*0.011,vertical: context.height*0.006),
            child: ProductsGridContainer(
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
