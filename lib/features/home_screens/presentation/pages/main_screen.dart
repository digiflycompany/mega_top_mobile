import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/adds_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_app_bar.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_row.dart';

import '../../../../core/utils/app_color.dart';

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
                 VerticalSpace(context.height*0.007),
                 const OurProductsList(),
                 VerticalSpace(context.height*0.03),
                 const ViewAllRow(
                   bigText: AppStrings.bestSellerEn,
                 ),
                 VerticalSpace(context.height*0.04),
                 Container(
                   width:context.width*0.707,
                   height: context.height*0.424125,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(context.height*0.0065),
                     boxShadow: const [
                       BoxShadow(
                         color: AppColors.containerShadow,
                         offset: Offset(0, 2),
                         blurRadius: 12,
                         spreadRadius: 0,
                       ),
                     ],
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding:  EdgeInsets.only(left: context.width*0.022,right: context.width*0.022,top: context.height*0.012,bottom:context.height*0.022 ),
                         child: Stack(
                           children: [
                             Container(
                               width: double.infinity,
                               height: context.height*0.269,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(context.height*0.0065),
                                 color: AppColors.iconsBackgroundColor,
                               ),
                               child:Center(child: Image.asset(AppAssets.hardDiskImage,width: context.width*0.27,)),
                             ),
                             Padding(
                               padding:  EdgeInsets.symmetric(vertical:context.height*0.012,horizontal:context.width*0.022),
                               child: Container(
                                 width: context.width*0.11,
                                 height:context.height*0.033,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(context.height*0.003),
                                   color: AppColors.redIconColor
                                 ),
                                 child: const Center(
                                   child: Text(
                                      AppStrings.discountPercentEn,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12
                                      ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
                 VerticalSpace(context.height*0.1),
               ],
          ),
        ),
      ),
    );
  }
}
