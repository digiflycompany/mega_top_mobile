import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import 'items_grid.dart';

class SearchResultGrid extends StatelessWidget {
  const SearchResultGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: context.width*0.05,
        mainAxisSpacing: context.height*0.022,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const ProductsGridContainer(
          productName: AppStrings.hardDiskEn,
          productPhoto: AppAssets.upsSearchResult,
          productType: AppStrings.storageUnitsEn,
          productPrice: AppStrings.le1500,
          discountPercent: AppStrings.discountPercentEn,
          discount: true,
        );
      },
    );
  }
}
