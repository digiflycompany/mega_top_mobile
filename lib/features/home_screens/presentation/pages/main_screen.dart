import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/adds_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/best_seller_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_app_bar.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_row.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:Size(double.infinity, context.height*0.19), //width and height
        child: const MainPageAppBar()
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
               children: [
                 VerticalSpace(context.height*0.022),
                 const AdvertisementList(),
                 VerticalSpace(context.height*0.04),
                 const ViewAllRow(
                   bigText: AppStrings.ourProductsEn,
                 ),
                 VerticalSpace(context.height*0.005),
                 const OurProductsList(),
                 VerticalSpace(context.height*0.03),
                 const ViewAllRow(
                   bigText: AppStrings.bestSellerEn,
                 ),
                 const BestSellerList(),
                 VerticalSpace(context.height*0.0245),
                 const ViewAllRow(
                   bigText: AppStrings.latestOffersEn,
                 ),
                 VerticalSpace(context.height*0.022),
                 SizedBox(
                   height: 240,
                   child: SingleChildScrollView(
                     physics: const BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Image.asset(AppAssets.upsOffers,width: context.width*0.7,),
                         Padding(
                           padding:  const EdgeInsets.only(top: 18,bottom:22 ),
                           child: Column(
                             children: [
                               Container(
                                 width: 90,
                                 height: 90,
                                 decoration: BoxDecoration(
                                   color: AppColors.onboardingBackgroundColor,
                                   borderRadius: BorderRadius.circular(4),
                                 ),
                               ),
                               const Spacer(),
                               Container(
                                 width: 90,
                                 height: 90,
                                 decoration: BoxDecoration(
                                   color: AppColors.onboardingBackgroundColor,
                                   borderRadius: BorderRadius.circular(4),
                                 ),
                               ),
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
                 VerticalSpace(context.height*0.1)
               ],
          ),
        ),
      ),
    );
  }
}
