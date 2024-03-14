import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class OfferGrid extends StatelessWidget {
  final List<GridItem> items;

  const OfferGrid({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 1,
      children: items.map((item) {
        return Container(
          width: context.width*0.222,
          height: context.height*0.124,
          color: AppColors.onboardingBackgroundColor,
          padding:  EdgeInsets.all(context.height*0.012),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(item.imagePath, width: 40),
              Text(item.text1),
              Text(item.text2),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class GridItem {
  final String imagePath;
  final String text1;
  final String text2;

  const GridItem(this.imagePath, this.text1, this.text2);
}

final List<GridItem> items = [
  const GridItem(AppAssets.smallHardDiskImage, AppStrings.storageUnitsSmallEn, AppStrings.discount15PercentEn),
  const GridItem(AppAssets.smallHardDiskImage, AppStrings.storageUnitsSmallEn, AppStrings.discount15PercentEn),
  const GridItem(AppAssets.smallRackImage, AppStrings.rackEn, AppStrings.discount15PercentEn),
  const GridItem(AppAssets.smallHardDiskImage, AppStrings.storageUnitsSmallEn, AppStrings.discount15PercentEn),

];

