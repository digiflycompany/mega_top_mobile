import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'best_seller_container.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
        child: SizedBox(
          height: context.height * 0.485,
          child: Row(
            children: [
              const BestSellerContainer(
                productName: AppStrings.hardDiskEn,
                productPhoto: AppAssets.hardDiskImage,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
                discountPercent: AppStrings.discountPercentEn,
                discount: true,
              ),
              HorizontalSpace(context.width * 0.045),
              const BestSellerContainer(
                productName: AppStrings.hardDiskEn,
                productPhoto: AppAssets.hardDiskImage,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
              ),
              HorizontalSpace(context.width * 0.045),
              const BestSellerContainer(
                productName: AppStrings.hardDiskEn,
                productPhoto: AppAssets.hardDiskImage,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
