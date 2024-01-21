import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/adds_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/main_page_app_bar.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/our_products_row.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:Size(double.infinity, context.height*0.19), //width and height
        child: const MainPageAppBar()
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: Column(
             children: [
               VerticalSpace(context.height*0.022),
               const AdvertisementList(),
               VerticalSpace(context.height*0.04),
               const OurProductsRow(),
               VerticalSpace(context.height*0.028),
               Container(
                 width: context.width*0.48575,
                 height: context.height*0.098,
                 decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(context.height*0.006),
                boxShadow: const [
                 BoxShadow(
                  color: AppColors.containerShadow,
                  offset: Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                  ),
                   ],
                 ),
                 child:  Padding(
                   padding:  EdgeInsets.symmetric(horizontal:context.width*0.037),
                   child: Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                         Image.asset(AppAssets.cameraControlSmall,width: context.width*0.13),
                         HorizontalSpace(context.width*0.02),
                         Padding(
                           padding:  EdgeInsets.symmetric(vertical: context.height*0.02),
                           child: const Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 AppStrings.surveillanceCamerasEn,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700
                                 ),
                               ),
                               Spacer(),
                               Text(
                                 AppStrings.twentyFiveProducts,
                                 style: TextStyle(
                                     color: AppColors.greyTextColor,
                                     fontSize: 12,
                                     fontWeight: FontWeight.w500
                                 ),
                               ),
                             ],
                           ),
                         )
                     ],
                   ),
                 ),
                ),
             ],
        ),
      ),
    );
  }
}
