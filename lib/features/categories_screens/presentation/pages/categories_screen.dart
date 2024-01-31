import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.categoriesEn)),
      body: Column(
        children: [
         VerticalSpace(context.height*0.033),
         Center(
           child: Container(
             width: 104,
             height: 104,
             decoration: BoxDecoration(
               color: AppColors.iconsBackgroundColor,
               border: Border.all(width: context.width*0.002,color: AppColors.onboardingBackgroundColor),
               borderRadius: BorderRadius.circular(context.height*0.006),
             ),
             child: Padding(
               padding:  EdgeInsets.symmetric(vertical: context.height*0.011),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset(AppAssets.upsSmall,width: context.width*0.174,),
                   const Text(
                     AppStrings.upsEn,
                     style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w700,
                       fontSize: 14
                     ),
                   )
                 ],
               ),
             ),
           ),
         )
        ],
      ) ,
    );
  }
}
