import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_search_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/your_latest_search_row.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/primary_app_bar.dart';
import '../widgets/primary_search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const PrimaryAppBar(AppStrings.searchForProductsEn)),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
          children: [
             VerticalSpace(context.height*0.012),
             const PrimarySearchBar(),
             // VerticalSpace(context.height*0.03),
             VerticalSpace(context.height*0.165),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     width: context.width*0.5,
                     height:context.height*0.207,
                     decoration: const BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle,
                       boxShadow: [
                         BoxShadow(
                           color: AppColors.circleShadow,
                           offset: Offset(0, 0),
                           blurRadius: 15,
                           spreadRadius: 0,
                         ),
                       ],
                     ),
                     child: Center(
                       child: Image.asset(AppAssets.noResultImg,width: context.width*0.222 ,),
                     )),
                   VerticalSpace(context.height*0.05),
                   const Text(
                     AppStrings.noResultsEn,
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 16,
                       fontWeight: FontWeight.w700
                     ),
                   ),
                   VerticalSpace(context.height*0.01),
                   const Text(
                     AppStrings.noResultLongEn,
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         color: AppColors.greyTextColor,
                         fontSize: 14,
                         fontWeight: FontWeight.w500
                     ),
                   ),
                 ],
               ),
             )
             // const YourLatestSearch(),
             // VerticalSpace(context.height*0.025),
             // const LatestSearchList(),
          ],
        ),
      )
    );
  }
}
