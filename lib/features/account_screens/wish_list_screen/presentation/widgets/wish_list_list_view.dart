import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/global_cubit.dart';
import 'package:mega_top_mobile/features/home_screens/data/product_model.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_list.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        productName: AppStrings.upsVersion1En,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.upsVersion1En,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.upsVersion1En,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.upsVersion1En,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
      ),
      Product(
        productName: AppStrings.upsVersion1En,
        productPhoto: AppAssets.upsSearchResult,
        productType: AppStrings.storageUnitsEn,
        productPrice: AppStrings.le1500,
        discountPercent: AppStrings.discountPercentEn,
        discount: false,
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
        itemCount: products.length, // Set the item count to the length of the products list
        itemBuilder: (BuildContext context, int index) {
          GlobalCubit globalCubit = context.read<GlobalCubit>();
          final product = products[index];
          return Padding(
            padding: EdgeInsets.only(right: context.width*0.011,left: context.width*0.011, bottom: context.height*0.027,top: context.height*0.006),
            child: ProductsListContainer(
              productName: product.productName,
              productPhoto: product.productPhoto,
              productType: product.productType,
              productPrice: product.productPrice,
              discountPercent: product.discountPercent,
              discount: product.discount,
              icon: AppAssets.favourFilledIcon,
              onTap: ()=>globalCubit.showRemoveFromFavouritesToast(context),
            ),
          );
        },
      ),
    );
  }
}
