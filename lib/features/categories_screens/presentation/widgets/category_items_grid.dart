import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../home_screens/data/product_model.dart';
import '../../../home_screens/presentation/widgets/items_grid.dart';

class CategoryItemsGridView extends StatelessWidget {
  const CategoryItemsGridView({super.key});

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
        productPhoto: AppAssets.storageUnitsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.storageUnitsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.storageUnitsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.storageUnitsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.hardDiskEn,
        productPhoto: AppAssets.storageUnitsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
    ];
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.width * 0.027,
          mainAxisSpacing: context.height * 0.019,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return  Padding(
            padding: EdgeInsets.only(right: context.width*0.011,left: context.width*0.011,top: context.height*0.004),
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