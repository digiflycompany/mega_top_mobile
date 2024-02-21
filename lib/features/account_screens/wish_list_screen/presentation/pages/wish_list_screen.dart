import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/wish_list_screen/presentation/widgets/wish_list_list_view.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import '../widgets/wish_list_count.dart';

class WishListPage extends StatelessWidget {
  final bool isEmpty = false;
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const PrimaryAppBar(
            AppStrings.wishListEn,
            favour: false,
          )),
      body:isEmpty?
         const EmptyDataPage(
        bigFontText: AppStrings.noWishListItemsEn,
        smallFontText: AppStrings.browseOurProductsDescriptionEn,
        buttonText: AppStrings.continueShoppingEn,
        icon: AppAssets.wishListIcon,
      ):
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
          child: const Column(
            children: [
               WishListCount(count: AppStrings.seven,),
               WishListView(),
          ],
        ),
      )
    );
  }
}
