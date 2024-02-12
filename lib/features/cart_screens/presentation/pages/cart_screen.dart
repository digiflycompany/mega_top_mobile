import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_cart_page.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height*0.089),
          child: const CustomFavouriteAppBar(AppStrings.shoppingCartEn)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
        child: const EmptyCartPage(),
      ),
    );
  }
}
