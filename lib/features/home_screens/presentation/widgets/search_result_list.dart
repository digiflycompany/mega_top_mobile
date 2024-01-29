import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/items_grid.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/search_options.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            VerticalSpace(context.height*0.028),
            const SearchOptionsRow(),
            VerticalSpace(context.height*0.033),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
              child:  Row(
                children: [
                  const ProductsGridContainer(
                    productName: AppStrings.hardDiskEn,
                    productPhoto: AppAssets.upsSearchResult,
                    productType: AppStrings.storageUnitsEn,
                    productPrice: AppStrings.le1500,
                    discountPercent: AppStrings.discountPercentEn,
                    discount: true,
                  ),
                  HorizontalSpace(context.width*0.045),
                  const ProductsGridContainer(
                    productName: AppStrings.hardDiskEn,
                    productPhoto: AppAssets.upsSearchResult,
                    productType: AppStrings.storageUnitsEn,
                    productPrice: AppStrings.le1500,
                    discountPercent: AppStrings.discountPercentEn,
                    discount: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
