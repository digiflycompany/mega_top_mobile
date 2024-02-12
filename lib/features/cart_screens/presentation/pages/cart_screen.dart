import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_cart_icon.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_cart_text.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EmptyCartIcon(),
          VerticalSpace(context.height*0.055),
          const EmptyCartText(),
        ],
      ),
    );
  }
}
