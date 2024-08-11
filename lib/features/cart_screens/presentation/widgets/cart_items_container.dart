import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/discount_container.dart';
import 'package:mega_top_mobile/core/widgets/product_photo_list_view.dart';
import 'package:mega_top_mobile/features/cart_screens/data/repositories/cart_repo.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_cubit.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/cubit/cart_states.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/arithmetic_container.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_name.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_price.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_quantity.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/cart_list_product_type.dart';

class CartItemsContainer extends StatelessWidget {
  final String? productPhoto;
  final String? productName;
  final String? productType;
  final String? productPrice;
  final String? discountPercent;
  final bool? discount;
  const CartItemsContainer(
      {super.key,
      this.productPhoto,
      this.productName,
      this.productType,
      this.productPrice,
      this.discount = false,
      this.discountPercent});

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
                bottom: context.height * 0.012),
            child: Stack(
              children: [
                ProductPhotoListView(
                  photo: productPhoto,
                ),
                discount == true
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.009,
                            horizontal: context.width * 0.016),
                        child: DiscountContainer(
                          discountPercent: discountPercent,
                          width: context.width * 0.1,
                          height: context.height * 0.028,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: context.width * 0.026,
                  top: context.height * 0.03,
                  bottom: context.height * 0.022),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartListProductName(text: productName),
                  CartListProductType(
                    text: productType,
                  ),
                  const Spacer(),
                  BlocProvider(
                    create: (context) => CartCubit(CartRepoImp()),
                    child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        //CartCubit cartCubit = context.read<CartCubit>();
                        return Row(
                          children: [
                            CartListProductPrice(
                              text: productPrice,
                            ),
                            const Spacer(),
                            ArithmeticContainer(
                              icon: AppAssets.plusIcon,
                              //onTap: cartCubit.increment,
                            ),
                            HorizontalSpace(context.width * 0.04),
                            CartListProductQuantity(
                              number: '0',
                            ),
                            HorizontalSpace(context.width * 0.04),
                            // cartCubit.itemCount == 1
                            //     ? const BasketContainer()
                            //     : ArithmeticContainer(
                            //         icon: AppAssets.minusIcon,
                            //         //onTap: cartCubit.decrement,
                            //       ),
                          ],
                        );
                      },
                    ),
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
