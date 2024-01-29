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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
          child: Column(
            children: [
              VerticalSpace(context.height*0.028),
              const SearchOptionsRow(),
              VerticalSpace(context.height*0.033),
              GridView.builder(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
