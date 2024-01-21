import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'our_products_container.dart';

class OurProductsList extends StatelessWidget {
  const OurProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.012),
        child: SizedBox(
          height: context.height*0.15,
          child: Row(
            children: [
              const OurProductsContainer(
                productPhoto: AppAssets.cameraControlSmall,
                productName: AppStrings.surveillanceCamerasEn,
                productQuantity: AppStrings.twentyFiveProducts,
              ),
              HorizontalSpace(context.width*0.045),
              const OurProductsContainer(
                productPhoto: AppAssets.upsSmall,
                productName: AppStrings.upsEn,
                productQuantity: AppStrings.twentyFiveProducts,
              ),
              HorizontalSpace(context.width*0.045),
              const OurProductsContainer(
                productPhoto: AppAssets.cameraControlSmall,
                productName: AppStrings.surveillanceCamerasEn,
                productQuantity: AppStrings.twentyFiveProducts,
              ),
              HorizontalSpace(context.width*0.045),
            ],
          ),
        ),
      ),
    );
  }
}
