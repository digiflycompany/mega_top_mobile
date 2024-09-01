import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/arithmetic_container.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_name.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_price.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_quantity.dart';

class CartItemsContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? quantity;
  final String? productPrice;
  final String productId;

  const CartItemsContainer({
    super.key,
    this.productPhoto,
    this.productName,
    this.quantity,
    this.productPrice,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => current is GetUserCartSuccess,
      builder: (context, state) {
        final cartItem = state is GetUserCartSuccess
            ? state.cartProducts.firstWhere(
              (item) => item['_id'] == productId,
          orElse: () => {},
        )
            : {};

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
                padding: EdgeInsetsDirectional.only(
                  start: context.width * 0.022,
                  end: context.width * 0.04,
                  top: context.height * 0.012,
                  bottom: context.height * 0.012,
                ),
                child: ProductPhotoListView(
                  photo: productPhoto,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: context.width * 0.026,
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
                            onTap: () {
                              context.read<CartCubit>().increaseQuantity(productId);
                            },
                          ),
                          HorizontalSpace(context.width * 0.04),
                          CartListProductQuantity(
                            number: cartItem.isNotEmpty
                                ? cartItem['quantity'].toString()
                                : quantity,
                          ),
                          HorizontalSpace(context.width * 0.04),
                          ArithmeticContainer(
                            icon: AppAssets.minusIcon,
                            onTap: () {
                              context.read<CartCubit>().decreaseQuantity(productId);
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
      },
    );
  }
}
