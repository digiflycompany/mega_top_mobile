import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/button_bottom_nav_bar.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_checkout_button.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/app_bar_fav_icon.dart';
import '../widgets/cart_items_list.dart';
import '../widgets/cart_screen_address.dart';
import '../widgets/shipment_quantity_row.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.circleAvatarBackground,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, context.height * 0.089),
          child: const CustomFavouriteAppBar(AppStrings.shoppingCartEn)),
      body: Column(
        children: [
          VerticalSpace(context.height * 0.028),
          const CartScreenAddress(),
          VerticalSpace(context.height * 0.028),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(
                children: [
                  VerticalSpace(context.height * 0.028),
                  const ShipmentQuantityRow(),
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
          onTap: () => Routes.shippingDetailsPageRoute.moveTo,
        ),
      ),
    );
  }
}
