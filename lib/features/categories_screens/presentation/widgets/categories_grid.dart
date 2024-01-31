import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_string.dart';
import '../../data/categories_model.dart';
import 'categories_small_card.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
     Category(
         categoryPhoto: AppAssets.upsSmall,
         categoryName: AppStrings.upsEn
     ),
     Category(
          categoryPhoto: AppAssets.smallHardImg,
          categoryName: AppStrings.storageEn
      ),
     Category(
          categoryPhoto: AppAssets.smallRackImage,
          categoryName: AppStrings.rackEn
      ),
     Category(
         categoryPhoto: AppAssets.networkImg,
         categoryName: AppStrings.networkEn
     ),
     Category(
          categoryPhoto: AppAssets.hiLookImg,
          categoryName: AppStrings.hiLookEn
      ),
     Category(
          categoryPhoto: AppAssets.cameraControlSmall,
          categoryName: AppStrings.hikVisionEn
      ),
     Category(
          categoryPhoto: AppAssets.ezVizImg,
          categoryName: AppStrings.ezVizEn
      ),
     Category(
          categoryPhoto: AppAssets.timeAttendanceImg,
          categoryName: AppStrings.timeAttendanceEn
      ),
    ];
    return Expanded(
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: context.width*0.045,
            mainAxisSpacing: context.height*0.022,
        ),
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return  CategoriesSmallCard(
            categoryPhoto: category.categoryPhoto,
            categoryName: category.categoryName,
          );
        },
      ),
    );
  }
}
