import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class LatestProductsList extends StatelessWidget {
  const LatestProductsList({super.key});

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
              const LatestProductsContainer(
                productName: AppStrings.hardDiskEn,
                productPhoto: AppAssets.hardDiskImage,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
              ),
              HorizontalSpace(context.width * 0.045),
              const LatestProductsContainer(
                productName: AppStrings.hardDiskEn,
                productPhoto: AppAssets.hardDiskImage,
                productType: AppStrings.storageUnitsEn,
                productPrice: AppStrings.le1500,
              ),
              HorizontalSpace(context.width * 0.045),
              const LatestProductsContainer(
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
