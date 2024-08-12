import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/arithmetic_container.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_name.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_price.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_quantity.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class CartItemsContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? quantity;
  final String? productPrice;
  final String productId; // Add this to uniquely identify each product

  const CartItemsContainer({
    super.key,
    this.productPhoto,
    this.productName,
    this.quantity,
    this.productPrice,
    required this.productId, // Require this in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.165,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.height * 0.0065),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: context.width * 0.022,
              right: context.width * 0.04,
              top: context.height * 0.012,
              bottom: context.height * 0.012,
            ),
            child: ProductPhotoListView(
              photo: productPhoto,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: context.width * 0.026,
                top: context.height * 0.03,
                bottom: context.height * 0.022,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartListProductName(text: productName),
                  const Spacer(),
                  Row(
                    children: [
                      CartListProductPrice(
                        text: productPrice,
                      ),
                      const Spacer(),
                      ArithmeticContainer(
                        icon: AppAssets.plusIcon,
                        onTap: () async {
                          await PreferencesHelper.increaseQuantity(productId);
                          context.read<CartCubit>().getUserCart();
                        },
                      ),
                      HorizontalSpace(context.width * 0.04),
                      CartListProductQuantity(
                        number: quantity,
                      ),
                      HorizontalSpace(context.width * 0.04),
                      // quantity==0?BasketContainer(
                      //   onTap: () async {
                      //     await PreferencesHelper.removeProduct(productId);
                      //     context.read<CartCubit>().getUserCart();
                      //   },
                      // )
                       ArithmeticContainer(
                        icon: AppAssets.minusIcon,
                        onTap: () async {
                          await PreferencesHelper.decreaseQuantity(productId);
                          context.read<CartCubit>().getUserCart();
                          // You might want to call a method to refresh the UI here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
