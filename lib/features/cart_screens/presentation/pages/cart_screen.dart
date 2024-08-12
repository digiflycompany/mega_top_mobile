import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/app_bar_fav_icon.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_checkout_button.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_items_list.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_screen_address.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.circleAvatarBackground,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.shoppingCartEn)),
      body: Column(
        children: [
          const CartScreenAddress(),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(
                children: [
                  VerticalSpace(context.height * 0.033),
                  const CartItemsListView(),
                ],
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: ButtonBottomNavBar(
        button: CartCheckoutButton(
          onTap: () => Routes.orderConfirmationPageRoute.moveTo,
        ),
      ),
    );
  }
}
