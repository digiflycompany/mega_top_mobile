import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_offer_container.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacer.dart';

class LatestOffersList extends StatelessWidget {
  const LatestOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.326,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.upsOffers,
              width: context.width * 0.7,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: context.height * 0.022, bottom: context.height * 0.033),
              child: const Column(
                children: [
                  LatestOffersContainer(
                    productPhoto: AppAssets.smallHardDiskImage,
                    productName: AppStrings.storageUnitsSmallEn,
                    productDiscount: AppStrings.discount15PercentEn,
                  ),
                  Spacer(),
                  LatestOffersContainer(
                    productPhoto: AppAssets.smallHardDiskImage,
                    productName: AppStrings.storageUnitsSmallEn,
                    productDiscount: AppStrings.discount15PercentEn,
                  ),
                ],
              ),
            ),
            HorizontalSpace(context.height * 0.022),
            Padding(
              padding: EdgeInsets.only(
                  top: context.height * 0.025, bottom: context.height * 0.03),
              child: const Column(
                children: [
                  LatestOffersContainer(
                    productPhoto: AppAssets.smallHardDiskImage,
                    productName: AppStrings.storageUnitsSmallEn,
                    productDiscount: AppStrings.discount15PercentEn,
                  ),
                  Spacer(),
                  LatestOffersContainer(
                    productPhoto: AppAssets.smallRackImage,
                    productName: AppStrings.rackEn,
                    productDiscount: AppStrings.discount15PercentEn,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
