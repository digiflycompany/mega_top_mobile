import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/adds_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/best_seller_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_offers_list.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/latest_products_list.dart';
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
                 VerticalSpace(context.height*0.008),
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
                // const LatestProductsList(),
                 VerticalSpace(context.height*0.0245),
                 const ViewAllRow(
                   bigText: AppStrings.latestOffersEn,
                 ),
                 VerticalSpace(context.height*0.02),
                const LatestOffersList(categoryId: "hW0j2MH1ki"),
                 VerticalSpace(context.height*0.025),
                 const ViewAllRow(
                   bigText: AppStrings.latestProducts,
                 ),
                 const LatestOffersList(categoryId: "nUiXlXolmK"),
                 VerticalSpace(context.height*0.02),
               ],
          ),
        ),
      ),
    );
  }
}
