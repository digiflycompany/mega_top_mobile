import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/home_screens/cubit/home_cubit.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../data/models/product_model.dart';
import 'items_grid.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key, required this.homeCubit});

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    // final List<Product> products = [
    //   Product(
    //     productName: AppStrings.hardDiskEn,
    //     productPhoto: AppAssets.upsSearchResult,
    //     productType: AppStrings.storageUnitsEn,
    //     productPrice: AppStrings.le1500,
    //     discountPercent: AppStrings.discountPercentEn,
    //     discount: true,
    //   ),
    //   Product(
    //     productName: AppStrings.hardDiskEn,
    //     productPhoto: AppAssets.upsSearchResult,
    //     productType: AppStrings.storageUnitsEn,
    //     productPrice: AppStrings.le1500,
    //     discountPercent: AppStrings.discountPercentEn,
    //     discount: true,
    //   ),
    //   Product(
    //     productName: AppStrings.hardDiskEn,
    //     productPhoto: AppAssets.storageUnitsSearchResult,
    //     productType: AppStrings.storageUnitsEn,
    //     productPrice: AppStrings.le1500,
    //     discountPercent: AppStrings.discountPercentEn,
    //     discount: true,
    //   ),
    //   Product(
    //     productName: AppStrings.hardDiskEn,
    //     productPhoto: AppAssets.storageUnitsSearchResult,
    //     productType: AppStrings.storageUnitsEn,
    //     productPrice: AppStrings.le1500,
    //     discountPercent: AppStrings.discountPercentEn,
    //     discount: true,
    //   ),
    //   Product(
    //     productName: AppStrings.hardDiskEn,
    //     productPhoto: AppAssets.upsSearchResult,
    //     productType: AppStrings.storageUnitsEn,
    //     productPrice: AppStrings.le1500,
    //     discountPercent: AppStrings.discountPercentEn,
    //     discount: true,
    //   ),
    //   Product(
    //     productName: AppStrings.hardDiskEn,
    //     productPhoto: AppAssets.upsSearchResult,
    //     productType: AppStrings.storageUnitsEn,
    //     productPrice: AppStrings.le1500,
    //     discountPercent: AppStrings.discountPercentEn,
    //     discount: true,
    //   ),
    // ];
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: homeCubit.searchModel!.data!.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.width * 0.027,
          mainAxisSpacing: context.height * 0.019,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = homeCubit.searchModel!.data!.products[index];
          return Padding(
            padding: EdgeInsets.only(
                right: context.width * 0.011,
                left: context.width * 0.011,
                top: context.height * 0.004),
            child: ProductsGridContainer(
              index: index,
              product: product,
              onTap: (){
                homeCubit.setCategoryProductIndex(selectedProductIndex: index);
                Routes.searchProductDetailsPageRoute.moveTo;
              },
              // discountPercent: product.discountPercent,
              // discount: product.discount,
            ),
          );
        },
      ),
    );
  }
}
